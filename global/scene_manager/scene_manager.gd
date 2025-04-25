extends Node

var team_resource: TeamResource

func _ready():
	team_resource = load("res://global/resource_manager/normal_team.tres")

func set_team(team: Array[CharacterResource]) -> void:
	team_resource.hero_team = team

func get_team() -> Array[CharacterResource]:
	return team_resource.hero_team

func get_gold() -> int:
	return team_resource.gold

func set_gold(gold: int) -> void:
	team_resource.gold = gold

func get_level() -> int:
	return team_resource.level

func set_level(level: int) -> void:
	team_resource.level = level

func add_magic_card(magic_card: MagicResource) -> void:
	team_resource.magic_cards.append(magic_card)

func get_magic_cards() -> Array[MagicResource]:
	return team_resource.magic_cards

func set_magic_cards(magic_cards: Array[MagicResource]) -> void:
	team_resource.magic_cards = magic_cards

func remove_magic_card(magic_card: MagicResource) -> void:
	team_resource.magic_cards.erase(magic_card)
