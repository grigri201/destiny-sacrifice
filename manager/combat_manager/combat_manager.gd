extends Node
class_name CombatManager

@onready var hero_team: Team
@onready var enemy_team: Team

@export var hero_list: Array[HERO_RESOURCE] = []
@export var enemy_list: Array[EnemyResource] = []

var hero_index: int = 0
var enemy_index: int = 0

var hero_slot: Node2D
var enemy_slot: Node = null

func _ready():
	hero_team = get_tree().current_scene.get_node("%HeroTeam")
	enemy_team = get_tree().current_scene.get_node("%EnemyTeam")

func init():
	for hero in hero_list:
		var slot = hero_team.get_free_slot()
		if slot:
			_init_characters(hero, slot, hero_team)

	for enemy in enemy_list:
		var slot = enemy_team.get_free_slot()
		if slot:
			_init_characters(enemy, slot, enemy_team)

func add_hero(hero: HERO_RESOURCE):
	hero_list.append(hero)

func add_enemy(enemy: EnemyResource):
	enemy_list.append(enemy)

func start_battle():
	EventBus.battle_started.emit()

func remove_hero(hero: HERO_RESOURCE):
	hero_list.erase(hero)

func remove_enemy(enemy: EnemyResource):
	enemy_list.erase(enemy)

func end_battle():
	EventBus.battle_ended.emit()

func next_hero():
	hero_index += 1
	if hero_index >= hero_list.size():
		return null
	var hero = hero_list[hero_index]
	if hero.is_alive():
		return hero
	else:
		return next_hero()

func next_enemy():
	enemy_index += 1
	if enemy_index >= enemy_list.size():
		return null
	var enemy = enemy_list[enemy_index]
	if enemy.is_alive():
		return enemy
	else:
		return next_enemy()

func _init_characters(res: CharacterResource, slot: Slot, team: Team):
	var character = Character.fromResource(res)
	slot.character = character
	character.position = slot.position
	character.set_character_resource(res)
	team.add_child(character)
