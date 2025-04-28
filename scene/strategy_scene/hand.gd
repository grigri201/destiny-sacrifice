extends HBoxContainer
class_name Hand

func _ready() -> void:
	for child in get_children():
		var magic_card := child as MagicCard
		add_magic_card_to_hand(magic_card)

func add_magic_card_to_hand(magic_card: MagicCard):
	if not has_node(magic_card.get_path()):
		add_child(magic_card)
	magic_card.parent = self
	magic_card.reparent_to_hand_requested.connect(_on_magic_card_reparent_requested)

func _on_magic_card_reparent_requested(card: MagicCard) -> void:
	card.reparent(self)