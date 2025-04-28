extends MagicCardState

func enter() -> void:
	if not magic_card.is_on_sale:
		transition_requested.emit.call_deferred(self, MagicCardState.State.BASE)
		return
	var buy_success := SceneManager.team_resource.buy_magic_card(magic_card.magic_resource)
	if not buy_success:
		transition_requested.emit.call_deferred(self, MagicCardState.State.ONSALE)
		return
	magic_card.color.color = Color.ORANGE
	transition_requested.emit.call_deferred(self, MagicCardState.State.BASE)
