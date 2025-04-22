extends Node2D
class_name Character

@export var character_resource: CharacterResource : set = set_character_resource

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D # Assuming the sprite node is named Sprite2D
@onready var hp_label: Label = $HPLabel
@onready var attack_label: Label = $AttackLabel

@export var attack_move_duration: float = 0.2
@export var attack_move_offset: Vector2 = Vector2(-24, 0)

const IDLE_ANIMATION_NAME: String = "idle"
const ATTACK_ANIMATION_NAME: String = "attack"

var is_attacking: bool = false # Flag to prevent concurrent attacks

static func from_resource(resource: CharacterResource) -> Character:
	var character = load("res://character/"+resource.type+"/"+resource.character_class+"/"+resource.character_class+".tscn").instantiate()
	return character as Character

func set_character_resource(new_resource: CharacterResource):
	# 如果旧资源存在且有效，断开连接
	if character_resource and is_instance_valid(character_resource):
		if character_resource.is_connected("attack_changed",Callable(self,"update_labels")):
			character_resource.disconnect("attack_changed",Callable(self,"update_labels"))
		if character_resource.is_connected("hp_changed",Callable(self,"update_labels")):
			character_resource.disconnect("hp_changed",Callable(self,"update_labels"))

	character_resource = new_resource

	if character_resource and is_instance_valid(character_resource):
		# 连接信号到 update_labels
		# 使用 bind() 可以让 update_labels 知道是哪个信号触发的（虽然这里不需要）
		character_resource.attack_changed.connect(update_labels)
		character_resource.hp_changed.connect(update_labels)

	# 立即更新一次标签
	await ready
	update_labels()

func update_labels():
	if character_resource:
		attack_label.text = str(character_resource.attack)
		hp_label.text = str(character_resource.HP)
	else:
		attack_label.text = "N/A"
		hp_label.text = "N/A"

func play_attack_animation(target: Character):
	var tween_move_to = create_tween()
	var original_position = global_position

	# Move to target
	tween_move_to.tween_property(self, "global_position", target.global_position + attack_move_offset, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_move_to.finished # Wait for movement to target to finish
	
	# Play attack animation
	animation_player.play("attack")
	await animation_player.animation_finished # Wait for animation to finish
	
	# Move back to original position
	var tween_move_back = create_tween()
	tween_move_back.tween_property(self, "global_position", original_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_move_back.finished # Wait for movement back to finish
	
	is_attacking = false # Reset the flag


func attack(target: Character):
	if is_attacking: # Prevent starting a new attack while one is running
		return
	EventBus.before_attack.emit(self, target)
	is_attacking = true
	play_attack_animation(target)
	EventBus.after_attack.emit(self, target)

func hurt(_opponent: Character):
	EventBus.before_hurt.emit(self, _opponent)
	var original_color = sprite.modulate
	sprite.modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = original_color
	EventBus.after_hurt.emit(self, _opponent)

func is_alive() -> bool:
	return character_resource.HP > 0
