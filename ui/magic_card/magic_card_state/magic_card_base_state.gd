extends MagicCardState

func enter() -> void:
	print("enter base state")
	if not magic_card.is_node_ready():
		await magic_card.ready

	if magic_card.tween and magic_card.tween.is_running():
		magic_card.tween.kill()
	print("reparent to hand requested")
	magic_card.reparent_to_hand_requested.emit(magic_card)
	magic_card.color.color = Color.WEB_GREEN
	magic_card.pivot_offset = Vector2.ZERO
	magic_card.is_on_sale = false

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		magic_card.pivot_offset = magic_card.get_global_mouse_position() - magic_card.global_position
		transition_requested.emit(self, MagicCardState.State.CLICKED)
