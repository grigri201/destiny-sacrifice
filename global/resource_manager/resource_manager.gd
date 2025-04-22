extends Node

func _ready():
	randomize()

func generate_random_hero() -> HeroResource:
	var hero_resource = HeroResource.new()
	
	# 随机选择职业
	var classes = ["knight", "archer", "mage"]
	hero_resource.character_class = classes[randi() % classes.size()]
	
	# 设置类型为 hero
	hero_resource.type = "hero"
	
	# 生成随机中文名字
	var first_names = ["艾", "布", "卡", "达", "伊", "弗", "格", "哈", "杰", "凯", "拉", "马", "纳", "欧", "佩", "奇", "瑞", "萨", "塔", "乌", "维", "沃", "希", "亚", "泽"]
	var second_names = ["伦", "伯", "克", "德", "恩", "弗", "格", "哈", "杰", "克", "尔", "姆", "纳", "欧", "普", "奇", "尔", "斯", "特", "尔", "文", "斯", "尔", "尔", "尔"]
	hero_resource.name = first_names[randi() % first_names.size()] + second_names[randi() % second_names.size()]
	
	# 设置等级为1
	hero_resource.level = 1

	# TODO 根据 character_class 设置初始属性
	hero_resource.attack = 2
	hero_resource.HP = 5

	print(hero_resource.skills)
	
	# 从 skill_map 中随机选择一个技能
	hero_resource.skills.append(get_random_skill())
	return hero_resource


func get_random_skill() -> SkillResource:
	var all_skills = SkillMap.get_all_skills()
	if all_skills.is_empty():
		printerr("SkillMap is empty!")
		return null
	
	var skill_keys = all_skills.keys()
	var random_skill_key = skill_keys[randi() % skill_keys.size()]
	return all_skills[random_skill_key]


func generate_enemy(enemy_key: String) -> EnemyResource:
	var enemy_resource = EnemyMap.get_enemy(enemy_key)
	if enemy_resource == null:
		printerr("Enemy resource not found in EnemyMap for key: ", enemy_key)
		return null
	return enemy_resource

