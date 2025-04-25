extends Hero
class_name Archer

@export var arrow_scene: PackedScene

@onready var arrow_spawn_point: Marker2D = $ArrowSpawnPoint


func play_attack_animation(target: Character):
	# Play attack animation (don't wait for it to finish here)
	animation_player.play("attack")

	# Wait 0.6 seconds (for animation timing)
	var arrow_timer = get_tree().create_timer(0.6)
	await arrow_timer.timeout

	# Instantiate and configure the arrow
	if arrow_scene:
		var arrow = arrow_scene.instantiate()
		arrow.opponent = self
		# Check if the arrow is valid
		if not is_instance_valid(arrow):
			push_error("Failed to instantiate arrow scene.")
			return # Cannot proceed without arrow

		# Add to the main scene tree to avoid position issues with parent movement
		get_tree().root.add_child(arrow) 
		arrow.global_position = arrow_spawn_point.global_position
		var angle = arrow.global_position.angle_to_point(target.global_position)
		arrow.rotation = angle
		
		# Tween the arrow towards the target
		var arrow_tween = create_tween()
		# Using LINEAR for consistent arrow speed (adjust if needed)
		arrow_tween.tween_property(arrow, "global_position", target.global_position, 0.3).set_trans(Tween.TRANS_LINEAR) 
		
		# Wait for the arrow hit signal OR the tween to finish as a fallback
		# Assumes the arrow scene has a signal named "hit"
		if arrow.has_signal("hit"):
			await arrow.hit
		else:
			push_warning("Arrow scene %s does not have a 'hit' signal. Waiting for tween to finish instead." % arrow_scene.resource_path)
			await arrow_tween.finished

	# Wait for the *entire* attack animation to finish if needed, 
	# or remove if the character should be ready sooner.
	await animation_player.animation_finished 


# Remove the original simple implementation:
# func play_attack_animation(target: Character):
#	 animation_player.play("attack")
	
	