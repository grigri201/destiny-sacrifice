extends Node

var hero_team: Array[CharacterResource] = []

func set_team(team: Array[CharacterResource]) -> void:
	hero_team = team

func get_team() -> Array[CharacterResource]:
	return hero_team

