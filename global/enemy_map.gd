extends Node

const ENEMY_CSV_PATH = "res://global/resource/enemy/enemy.csv"

var _enemies: Dictionary = {}

func _ready():
	_load_enemies_from_csv()

func _load_enemies_from_csv():
	if not FileAccess.file_exists(ENEMY_CSV_PATH):
		printerr("Enemy CSV file not found at path: ", ENEMY_CSV_PATH)
		return

	var file = FileAccess.open(ENEMY_CSV_PATH, FileAccess.READ)
	if file == null:
		printerr("Failed to open enemy CSV file. Error code: ", FileAccess.get_open_error())
		return

	# Skip header line
	var header = file.get_csv_line()
	if header.is_empty():
		printerr("CSV header is empty.")
		file.close()
		return
		
	# Assuming header order: name,character_class,type,attack,hp,skills,loot_level
	# In a real scenario, validating header names against expected columns is safer
	var column_count = header.size()

	while not file.eof_reached():
		var data = file.get_csv_line()
		# Skip empty lines or lines with incorrect column count
		if data.is_empty() or data.size() != column_count: 
			if not data.is_empty(): # Print warning only if line is not empty but malformed
				printerr("Skipping malformed CSV line (expected 7 columns): ", data)
			continue 

		var enemy_resource = EnemyResource.new()
		
		# Assign values safely, converting types
		enemy_resource.name = data[0]
		enemy_resource.character_class = data[1]
		enemy_resource.type = data[2]
		enemy_resource.attack = int(data[3]) if data[3].is_valid_int() else 0
		enemy_resource.HP = int(data[4]) if data[4].is_valid_int() else 0
		
		# Process skills
		var skill_keys_str = data[5]
		if not skill_keys_str.is_empty():
			var skill_keys = skill_keys_str.split("|")
			for skill_key in skill_keys:
				skill_key = skill_key.strip_edges() # Remove potential whitespace
				if not skill_key.is_empty():
					# Assuming a global SkillMap singleton exists
					var skill_resource = SkillMap.get_skill(skill_key) 
					if skill_resource:
						# Assuming EnemyResource has a 'skills' array property
						enemy_resource.skills.append(skill_resource) 
					else:
						printerr("Skill not found in SkillMap for key: '", skill_key, "' in enemy: ", enemy_resource.name)

		# Assign loot_level (index updated)
		enemy_resource.loot_level = int(data[6]) if data[6].is_valid_int() else 0

		if not enemy_resource.name.is_empty():
			if _enemies.has(enemy_resource.name):
				printerr("Duplicate enemy name found in CSV: ", enemy_resource.name, ". Overwriting.")
			_enemies[enemy_resource.name] = enemy_resource
		else:
			printerr("Skipping enemy entry with empty name.")

	file.close() # Ensure file is closed


func get_enemy(enemy_name: String) -> EnemyResource:
	"""
	Retrieves an EnemyResource by its name.
	Returns null if the enemy is not found.
	"""
	return _enemies.get(enemy_name, null)
