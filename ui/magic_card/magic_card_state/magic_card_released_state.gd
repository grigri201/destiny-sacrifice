extends MagicCardState

var played: bool

func enter() -> void:
	magic_card.color.color = Color.DARK_VIOLET
	played = false

	if not magic_card.targets.is_empty():
		played = true
		print("play magic card for target: ", magic_card.targets)

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	if played:
		return
	transition_requested.emit(self, MagicCardState.State.BASE)