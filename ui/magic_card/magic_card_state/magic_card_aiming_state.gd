extends MagicCardState

func enter() -> void:
	magic_card.color.color = Color.WEB_PURPLE
	magic_card.targets.clear()
	var offset := Vector2(magic_card.parent.size.x / 2, -magic_card.size.y / 2)
	offset.x -= magic_card.size.x / 2
	magic_card.animate_to_position(magic_card.parent.global_position + offset, 0.2)
	magic_card.drop_point_detector.monitoring = false
	EventBus.magic_card_aim_started.emit(magic_card)

func exit() -> void:
	print("aiming exited")
	EventBus.magic_card_aim_ended.emit(magic_card)

func on_input(event: InputEvent) -> void:
	if event.is_action_pressed("right_mouse"):
		transition_requested.emit(self, MagicCardState.State.BASE)
	elif event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse"):
		get_viewport().set_input_as_handled()
		print("try to release")
		transition_requested.emit(self, MagicCardState.State.RELEASED)
