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

func get_level() -> int:
	return team_resource.level

func get_magic_cards() -> Array[MagicCardResource]:
	return team_resource.magic_cards