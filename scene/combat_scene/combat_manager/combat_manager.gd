extends Node
class_name CombatManager

@onready var hero_team: Node2D
@onready var enemy_team: Node2D

var heroes: Array[Character] = []
var enemies: Array[Character] = []

@export var hero_vertical_spacing: float = 100.0
@export var enemy_vertical_spacing: float = 100.0
@export var hero_top_offset: float = 0.0
@export var enemy_top_offset: float = 0.0

var _turn_queue: Array[Character] = []
var _current_attacker_index: int = -1
var _battle_active: bool = false

func _ready():
	hero_team = get_parent().get_node("HeroTeam")
	enemy_team = get_parent().get_node("EnemyTeam")
	if not hero_team:
		printerr("CombatManager: HeroTeam node not found.")
	if not enemy_team:
		printerr("CombatManager: EnemyTeam node not found.")

func add_hero(hero_resource: HeroResource):
	if not hero_resource:
		printerr("CombatManager: Tried to add null hero resource.")
		return
	if not hero_team:
		printerr("CombatManager: Cannot add hero, HeroTeam node is missing.")
		return

	var character = Character.from_resource(hero_resource)
	character.set_character_resource(hero_resource)
	heroes.append(character)
	hero_team.add_child(character)
	_arrange_team(heroes, hero_vertical_spacing, hero_top_offset)
	print("CombatManager: Added hero ", character.character_resource.character_class, " to HeroTeam")

func add_enemy(enemy_resource: EnemyResource):
	if not enemy_resource:
		printerr("CombatManager: Tried to add null enemy resource.")
		return
	if not enemy_team:
		printerr("CombatManager: Cannot add enemy, EnemyTeam node is missing.")
		return

	var character = Character.from_resource(enemy_resource)
	character.set_character_resource(enemy_resource)
	enemies.append(character)
	enemy_team.add_child(character)
	_arrange_team(enemies, enemy_vertical_spacing, enemy_top_offset)
	print("CombatManager: Added enemy ", character.character_resource.character_class, " to EnemyTeam")

func _arrange_team(character_list: Array[Character], vertical_spacing: float, top_offset: float):
	if character_list.is_empty():
		return

	var count = character_list.size()
	var start_y = top_offset

	for i in range(count):
		var character = character_list[i]
		if is_instance_valid(character):
			character.position = Vector2(0, start_y + i * vertical_spacing)
		else:
			printerr("CombatManager: Found invalid character instance during arrangement.")

func start_battle():
	if heroes.is_empty() or enemies.is_empty():
		printerr("CombatManager: Cannot start battle with empty teams.")
		return

	_build_turn_queue()
	if _turn_queue.is_empty():
		printerr("CombatManager: Turn queue is empty after build.")
		return

	_battle_active = true
	_current_attacker_index = -1
	print("--- Battle Started ---")
	_next_turn()

func _build_turn_queue():
	_turn_queue.clear()
	_turn_queue.append_array(heroes.filter(func(h): return is_instance_valid(h) and h.is_alive()))
	_turn_queue.append_array(enemies.filter(func(e): return is_instance_valid(e) and e.is_alive()))
	print("CombatManager: Built turn queue with ", _turn_queue.size(), " participants.")

func _next_turn():
	if not _battle_active:
		return

	_current_attacker_index = (_current_attacker_index + 1) % _turn_queue.size()
	var attacker = _turn_queue[_current_attacker_index]

	if not is_instance_valid(attacker) or not attacker.is_alive():
		print("CombatManager: Attacker ", attacker.character_resource.character_class if is_instance_valid(attacker) else "INVALID", " is no longer valid or alive. Rebuilding queue and trying next turn.")
		_rebuild_and_continue_turn()
		return

	var target_team: Array[Character]
	if heroes.has(attacker):
		target_team = enemies.filter(func(e): return is_instance_valid(e) and e.is_alive())
	else:
		target_team = heroes.filter(func(h): return is_instance_valid(h) and h.is_alive())

	if target_team.is_empty():
		_end_battle(heroes.has(attacker))
		return

	var target = target_team[0]

	print("Turn ", _current_attacker_index + 1, ": ", attacker.character_resource.character_class, " attacks ", target.character_resource.character_class)

	# Add a 2-second delay after the attack message
	await get_tree().create_timer(2.0).timeout

	call_deferred("_next_turn")

func _rebuild_and_continue_turn():
	_build_turn_queue()
	if _turn_queue.is_empty():
		_end_battle(not enemies.is_empty())
	elif _battle_active:
		_current_attacker_index = -1
		call_deferred("_next_turn")

func remove_hero(hero: Character):
	if heroes.has(hero):
		heroes.erase(hero)
		if is_instance_valid(hero):
			hero.queue_free()
		_arrange_team(heroes, hero_vertical_spacing, hero_top_offset)

func remove_enemy(enemy: Character):
	if enemies.has(enemy):
		enemies.erase(enemy)
		if is_instance_valid(enemy):
			enemy.queue_free()
		_arrange_team(enemies, enemy_vertical_spacing, enemy_top_offset)

func _end_battle(heroes_won: bool):
	_battle_active = false
	_turn_queue.clear()
	_current_attacker_index = -1
	if heroes_won:
		print("--- Battle Ended: Heroes Win! ---")
	else:
		print("--- Battle Ended: Enemies Win! ---")
