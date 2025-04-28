extends MagicCardState

func enter() -> void:
	if not magic_card.is_node_ready():
		await magic_card.ready

	magic_card.reparent_to_store_requested.emit(magic_card)
	magic_card.color.color = Color.WEB_MAROON
	magic_card.pivot_offset = Vector2.ZERO

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		magic_card.pivot_offset = magic_card.get_global_mouse_position() - magic_card.global_position
		transition_requested.emit(self, MagicCardState.State.CLICKED)