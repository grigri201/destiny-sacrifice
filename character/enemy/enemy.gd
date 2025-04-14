extends Character
class_name Enemy

@export var hero_target: Hero

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			if hero_target:
				attack(hero_target)