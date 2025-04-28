extends MagicCardState

const drag_minimum_threshold := 0.02

var minimum_drag_time_elapsed := false

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		magic_card.reparent(ui_layer)
	magic_card.color.color = Color.NAVY_BLUE

	minimum_drag_time_elapsed = false
	var threshold_timer := get_tree().create_timer(drag_minimum_threshold, false)
	threshold_timer.timeout.connect(func(): minimum_drag_time_elapsed = true)

func on_input(event: InputEvent) -> void:
	var single_targetd := magic_card.magic_resource.is_single_target()
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse") 

	if single_targetd and mouse_motion and magic_card.targets.size() > 0:
		transition_requested.emit(self, MagicCardState.State.AIMING)
		return

	if mouse_motion:
		magic_card.global_position = magic_card.get_global_mouse_position() - magic_card.pivot_offset

	if cancel:
		if magic_card.is_on_sale:
			transition_requested.emit(self, MagicCardState.State.ONSALE)
		else:
			transition_requested.emit(self, MagicCardState.State.BASE)
	elif minimum_drag_time_elapsed and confirm:
		get_viewport().set_input_as_handled()
		if magic_card.is_on_sale:
			transition_requested.emit(self, MagicCardState.State.BASE)
		if magic_card.is_on_sale:
			transition_requested.emit(self, MagicCardState.State.RELEASED)
		