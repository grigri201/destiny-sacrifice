extends Node2D
class_name Character

@export var character_resource: CharacterResource : set = set_character_resource

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D # Assuming the sprite node is named Sprite2D
@onready var hp_label: Label = $HPLabel
@onready var attack_label: Label = $AttackLabel
@onready var hit_area: Area2D = $HitArea

@export var attack_move_duration: float = 0.2
@export var attack_horizontal_offset: float = 24.0

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

	character_resource = new_resource.duplicate()

	if character_resource and is_instance_valid(character_resource):
		# 连接信号到 update_labels
		# 使用 bind() 可以让 update_labels 知道是哪个信号触发的（虽然这里不需要）
		character_resource.attack_changed.connect(update_labels)
		character_resource.hp_changed.connect(update_labels)

	# 立即更新一次标签
	await ready
	update_labels()
	hit_area.area_entered.connect(hurt)

func update_labels(_value = null):
	print("update_labels")
	if character_resource:
		attack_label.text = str(character_resource.attack)
		hp_label.text = str(character_resource.HP)
	else:
		attack_label.text = "N/A"
		hp_label.text = "N/A"

func play_attack_animation(target: Character):
	var tween_move_to = create_tween()
	var start_position = global_position # Position after pre-attack move (if any)

	# Determine move offset based on attacker type
	var move_offset = Vector2.ZERO
	if character_resource: # Check attacker's resource
		if character_resource.type == "hero":
			# Hero attacks: move to the left of the target
			move_offset = Vector2(-attack_horizontal_offset, 0)
		elif character_resource.type == "enemy":
			# Enemy attacks: move to the right of the target
			move_offset = Vector2(attack_horizontal_offset, 0)

	# Calculate final position
	var final_target_position = target.global_position + move_offset
	tween_move_to.tween_property(self, "global_position", final_target_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_move_to.finished # Wait for movement to target to finish

	# Play attack animation
	animation_player.play("attack")
	await animation_player.animation_finished # Wait for animation to finish

	# Move back slightly to the position where attack animation started
	var tween_move_back_slightly = create_tween()
	tween_move_back_slightly.tween_property(self, "global_position", start_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_move_back_slightly.finished # Wait for slight movement back to finish

func attack(target: Character):
	if is_attacking: # Prevent starting a new attack while one is running
		return
	EventBus.before_attack.emit(self, target)
	is_attacking = true

	var original_position = global_position # Store the very initial position

	# Add pre-attack movement based on character type
	var pre_attack_move_duration = 0.2
	var pre_attack_pause_duration = 0.2 # Pause duration
	var pre_attack_move_offset = Vector2.ZERO
	if character_resource and character_resource.type == "hero":
		pre_attack_move_offset = Vector2(32, 0)
	elif character_resource and character_resource.type == "enemy":
		pre_attack_move_offset = Vector2(-32, 0)

	if pre_attack_move_offset != Vector2.ZERO:
		var tween_pre_attack = create_tween()
		# Use current global_position for the start of this tween
		tween_pre_attack.tween_property(self, "global_position", global_position + pre_attack_move_offset, pre_attack_move_duration).set_trans(Tween.TRANS_SINE)
		await tween_pre_attack.finished
		# Add pause after pre-attack movement
		await get_tree().create_timer(pre_attack_pause_duration).timeout

	# Now execute the attack animation sequence
	await play_attack_animation(target)

	# After attack animation, move back to the very original position
	var tween_final_return = create_tween()
	tween_final_return.tween_property(self, "global_position", original_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_final_return.finished

	is_attacking = false # Reset the flag after all movements are complete
	EventBus.after_attack.emit(self, target)

func hurt(area: Area2D):
	var opponent: Character = null # Initialize opponent

	# Check if the owner of the entering area is a Character
	if area.owner is Character:
		opponent = area.owner as Character
	else:
		opponent = area.opponent

	# If no valid opponent Character was found, exit
	if not opponent:
		printerr("Hurt triggered, but the entering area's owner is not a Character: ", area.owner)
		return
	# Proceed with hurt logic using the identified opponent
	EventBus.before_hurt.emit(self, opponent)
	var original_color = sprite.modulate
	sprite.modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	character_resource.HP -= opponent.character_resource.attack
	if character_resource.HP <= 0:
		die() # Call die method if HP is zero or less
	sprite.modulate = original_color
	EventBus.after_hurt.emit(self, opponent)

func is_alive() -> bool:
	return character_resource.HP > 0

func die():
	# TODO: Implement death logic, e.g., play death animation, emit signal, remove node
	print(character_resource.name + " has died.")
	if animation_player.has_animation("dying"):
		animation_player.play("dying")
		await animation_player.animation_finished
	queue_free() # Example: remove the character from the scene
