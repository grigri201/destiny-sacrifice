extends Node
class_name CombatManager

# 英雄队伍节点
@onready var hero_team: Node2D
# 敌人队伍节点
@onready var enemy_team: Node2D

# 存储英雄和敌人的数组
var heroes: Array[Character] = []
var enemies: Array[Character] = []

# 角色垂直间距和顶部偏移
@export var hero_vertical_spacing: float = 100.0
@export var enemy_vertical_spacing: float = 100.0
@export var hero_top_offset: float = 0.0
@export var enemy_top_offset: float = 0.0

# 战斗状态变量
var _battle_active: bool = false
var _is_hero_turn: bool = true # 标记是否轮到英雄行动
var _current_hero_index: int = -1 # 当前行动英雄索引
var _current_enemy_index: int = -1 # 当前行动敌人索引

# 初始化，获取队伍节点
func _ready():
	randomize() # Initialize random number generator
	hero_team = get_parent().get_node("HeroTeam")
	enemy_team = get_parent().get_node("EnemyTeam")
	if not hero_team:
		printerr("CombatManager: HeroTeam node not found.")
	if not enemy_team:
		printerr("CombatManager: EnemyTeam node not found.")

# 添加英雄到队伍
func add_hero(hero_resource: HeroResource):
	_add_character(hero_resource, heroes, hero_team, hero_vertical_spacing, hero_top_offset, "HeroTeam")

# 添加敌人到队伍
func add_enemy(enemy_resource: EnemyResource):
	_add_character(enemy_resource, enemies, enemy_team, enemy_vertical_spacing, enemy_top_offset, "EnemyTeam")

# 通用添加角色逻辑
func _add_character(char_resource: CharacterResource, team_array: Array[Character], team_node: Node2D, spacing: float, offset: float, team_name: String):
	if not char_resource:
		printerr("CombatManager: Tried to add null character resource to ", team_name)
		return
	if not team_node:
		printerr("CombatManager: Cannot add character, ", team_name, " node is missing.")
		return
	print("char_resource: ", char_resource)
	var character = Character.from_resource(char_resource)
	character.set_character_resource(char_resource)
	team_array.append(character)
	team_node.add_child(character)
	_arrange_team(team_array, spacing, offset)
	print("CombatManager: Added ", character.character_resource.character_class, " to ", team_name)


# 排列队伍角色位置
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
			printerr("CombatManager: Found invalid character during arrangement.") # 发现无效角色

# 开始战斗
func start_battle():
	if heroes.is_empty() or enemies.is_empty():
		printerr("CombatManager: Cannot start battle with empty teams.") # 队伍空，无法开始
		return

	# 重置战斗状态
	_battle_active = true
	_is_hero_turn = true # 英雄先攻
	_current_hero_index = -1
	_current_enemy_index = -1

	print("--- Battle Started ---") # 战斗开始
	_next_turn()

# 进入下一回合 (轮流机制)
func _next_turn():
	if not _battle_active:
		return # 战斗未激活

	# 检查战斗是否已结束
	if _check_battle_over():
		return

	var attacker: Character = null
	var target_team: Array[Character]

	if _is_hero_turn:
		# 轮到英雄
		attacker = _find_next_alive_character(heroes, _current_hero_index)
		if attacker:
			_current_hero_index = heroes.find(attacker) # 更新当前英雄索引
			target_team = enemies.filter(func(e): return is_instance_valid(e) and e.is_alive()) # 目标：存活敌人
		else:
			printerr("CombatManager: No alive heroes found, but battle not over?") # 逻辑错误检查
			_end_battle(false) # 理论上不应发生，除非 _check_battle_over 失败
			return
	else:
		# 轮到敌人
		attacker = _find_next_alive_character(enemies, _current_enemy_index)
		if attacker:
			_current_enemy_index = enemies.find(attacker) # 更新当前敌人索引
			target_team = heroes.filter(func(h): return is_instance_valid(h) and h.is_alive()) # 目标：存活英雄
		else:
			printerr("CombatManager: No alive enemies found, but battle not over?") # 逻辑错误检查
			_end_battle(true) # 理论上不应发生
			return

	# 检查目标队伍是否为空 (虽然_check_battle_over应该已处理)
	if target_team.is_empty():
		printerr("CombatManager: Target team empty after attacker selected.") # 逻辑错误检查
		_end_battle(_is_hero_turn) # 如果英雄攻击，敌人为空则英雄胜，反之亦然
		return

	# 选择随机目标
	var target = target_team[randi() % target_team.size()]

	var turn_owner_string = "Hero" if _is_hero_turn else "Enemy"
	print("Turn: ", turn_owner_string, " ", attacker.character_resource.character_class, " attacks ", target.character_resource.character_class) # 回合信息

	# TODO: 实现攻击逻辑
	await attacker.attack(target)

	# 切换回合方
	_is_hero_turn = not _is_hero_turn

	# 攻击后等待
	await get_tree().create_timer(1.0).timeout # 缩短等待时间为1秒

	# 延迟调用下一回合
	call_deferred("_next_turn")

# 查找队伍中下一个存活的角色
func _find_next_alive_character(team: Array[Character], current_index: int) -> Character:
	if team.is_empty():
		return null
	var start_index = (current_index + 1) % team.size()
	for i in range(team.size()):
		var check_index = (start_index + i) % team.size()
		var character = team[check_index]
		if is_instance_valid(character) and character.is_alive():
			return character
	return null # 没有找到存活的角色
# 移除英雄
func remove_hero(hero: Character):
	_remove_character(hero, heroes, hero_vertical_spacing, hero_top_offset)

# 移除敌人
func remove_enemy(enemy: Character):
	_remove_character(enemy, enemies, enemy_vertical_spacing, enemy_top_offset)

# 通用移除角色逻辑
func _remove_character(character: Character, team_array: Array[Character], spacing: float, offset: float):
	if team_array.has(character):
		var index = team_array.find(character)
		team_array.erase(character)
		# 如果移除的是当前回合或之前的角色，可能需要调整索引
		# 为简单起见，暂时不处理移除对当前回合索引的精确影响，依赖 _find_next_alive_character 查找
		if is_instance_valid(character):
			character.queue_free() # 释放节点
		_arrange_team(team_array, spacing, offset) # 重新排列队伍

# 检查战斗是否结束
func _check_battle_over() -> bool:
	var alive_heroes = heroes.filter(func(h): return is_instance_valid(h) and h.is_alive()).size()
	var alive_enemies = enemies.filter(func(e): return is_instance_valid(e) and e.is_alive()).size()

	if alive_heroes == 0:
		_end_battle(false) # 英雄全灭
		return true
	elif alive_enemies == 0:
		_end_battle(true) # 敌人全灭
		return true
	return false # 战斗继续

# 结束战斗
func _end_battle(heroes_won: bool):
	if not _battle_active: return # 防止重复调用
	_battle_active = false
	# _turn_queue.clear() # 已移除
	_current_hero_index = -1
	_current_enemy_index = -1
	if heroes_won:
		print("--- Battle Ended: Heroes Win! ---") # 英雄胜利
	else:
		print("--- Battle Ended: Enemies Win! ---") # 敌人胜利
	# TODO: 添加战斗结束后的逻辑，如返回场景、显示结果等
