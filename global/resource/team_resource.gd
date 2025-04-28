extends Resource
class_name TeamResource

signal team_data_changed

@export var gold: int = 10: set = set_gold
@export var magic_cards: Array[MagicCardResource] = []
@export var hero_team: Array[CharacterResource] = []
@export var level: int = 1

@export var level_up_cost: Array[int] = [2, 3, 4, 5, 6, 7, 8]

func get_level_up_cost() -> int:
	return level_up_cost[level - 1]

func set_gold(value: int) -> void:
	if gold != value:
		gold = value
		emit_signal("team_data_changed")

func level_up() -> void:
	if gold < get_level_up_cost():
		return
	var cost = get_level_up_cost() # Store cost before changing gold
	level += 1
	set_gold(gold - cost) # Use setter
	emit_signal("team_data_changed") # Emit for level change as well

func buy_magic_card(magic_card: MagicCardResource) -> bool:
	if gold < magic_card.price:
		return false
	print("buy magic card: ", magic_card.name)
	print("magic_card.price: ", magic_card.price)
	set_gold(gold - magic_card.price) # Use setter (already emits)
	print("gold: ", gold)
	magic_cards.append(magic_card)
	emit_signal("team_data_changed") # Emit for magic card change
	return true

func sell_magic_card(magic_card: MagicCardResource) -> bool:
	if not magic_cards.has(magic_card):
		return false
	set_gold(gold + magic_card.price) # Use setter (already emits)
	magic_cards.erase(magic_card)
	emit_signal("team_data_changed") # Emit for magic card change
	return true

func use_magic_card(magic_card: MagicCardResource) -> bool:
	if not magic_cards.has(magic_card):
		return false
	magic_cards.erase(magic_card)
	return true