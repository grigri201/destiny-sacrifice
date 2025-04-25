extends Resource
class_name TeamResource

@export var gold: int = 0
@export var magic_cards: Array[MagicResource] = []
@export var hero_team: Array[CharacterResource] = []
@export var level: int = 1

@export var level_up_cost: Array[int] = [2, 3, 4, 5, 6, 7, 8]

func get_level_up_cost() -> int:
	return level_up_cost[level - 1]

func level_up() -> void:
	if gold < get_level_up_cost():
		return
	level += 1
	gold -= get_level_up_cost()
