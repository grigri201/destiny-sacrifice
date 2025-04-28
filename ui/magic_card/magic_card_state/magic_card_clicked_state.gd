extends MagicCardState

func enter() -> void:
	magic_card.color.color = Color.ORANGE
	magic_card.drop_point_detector.monitoring = true

func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, MagicCardState.State.DRAGGING)