extends Hero
class_name Mage

@export var fireball_scene: PackedScene

@onready var fireball_spawn_point: Sprite2D = $CreatingFireBallSprite

func play_attack_animation(target: Character):
	# Store the position before starting the attack animation sequence
	var start_position = global_position 

	# Play attack animation (don't wait for it to finish here)
	animation_player.play("attack")
	
	# Wait 0.9 seconds (e.g., for casting animation part)
	var fireball_timer = get_tree().create_timer(0.9)
	await fireball_timer.timeout

	# Instantiate and configure the fireball
	if fireball_scene:
		var fireball = fireball_scene.instantiate()
		fireball.opponent = self
		# Check if the fireball is valid and has the required signal
		if not is_instance_valid(fireball):
			push_error("Failed to instantiate fireball scene.")
			return # Cannot proceed without fireball

		# Add to the main scene tree to avoid position issues with parent movement
		get_tree().root.add_child(fireball) 
		fireball.global_position = fireball_spawn_point.global_position
		var angle = fireball.global_position.angle_to_point(target.global_position)
		fireball.rotation = angle
		
		# Tween the fireball towards the target
		var fireball_tween = create_tween()
		# Using CUBIC and EASE_IN for acceleration effect
		fireball_tween.tween_property(fireball, "global_position", target.global_position, 0.3).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN) 
		# Wait for the fireball hit signal OR the tween to finish as a fallback
		if fireball.has_signal("hit"):
			print("Waiting for fireball hit signal...") # Debug print
			await fireball.hit
			print("Fireball hit signal received.") # Debug print
		else:
			push_warning("Fireball scene %s does not have a 'hit' signal. Waiting for tween to finish instead." % fireball_scene.resource_path)
			await fireball_tween.finished

	# --- Remove original animation wait --- 
	# await animation_player.animation_finished 

	# Now that the fireball has hit (or finished moving), move the mage back
	var tween_move_back = create_tween() 
	tween_move_back.tween_property(self, "global_position", start_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_move_back.finished 

