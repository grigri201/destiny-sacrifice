extends Character
class_name Hero

@export var enemy_target: Character

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			if enemy_target:
				attack(enemy_target)
			else:
				print("Hero: No enemy target assigned.")
