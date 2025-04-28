extends GridContainer
class_name MagicCardGrid

func _ready() -> void:
	for child in get_children():
		var magic_card := child as MagicCard
		magic_card.reparent_to_store_requested.connect(_on_magic_card_reparent_to_store_requested)

func add_magic_card_to_store(magic_card: MagicCard):
	add_child(magic_card)
	magic_card.reparent_to_store_requested.connect(_on_magic_card_reparent_to_store_requested)

func _on_magic_card_reparent_to_store_requested(card: MagicCard) -> void:
	card.reparent(self)