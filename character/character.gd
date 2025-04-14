extends Node2D
class_name Character

signal before_attack(source: Character, target: Character)
signal after_attack(source: Character, target: Character)
signal before_hurt(source: Character, opponent: Character)
signal after_hurt(source: Character, opponent: Character)

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D # Assuming the sprite node is named Sprite2D

@export var attack_move_duration: float = 0.2
@export var attack_move_offset: Vector2 = Vector2(-24, 0)

const IDLE_ANIMATION_NAME: String = "idle"
const ATTACK_ANIMATION_NAME: String = "attack"

var is_attacking: bool = false # Flag to prevent concurrent attacks

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
	before_attack.emit(self, target)
	is_attacking = true
	play_attack_animation(target)
	after_attack.emit(self, target)

func hurt(_opponent: Character):
	before_hurt.emit(self, _opponent)
	var original_color = sprite.modulate
	sprite.modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = original_color
	after_hurt.emit(self, _opponent)
