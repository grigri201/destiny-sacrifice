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

	# Adding log before reading header
	print("Starting to load enemies from: ", ENEMY_CSV_PATH)

	# Skip header line
	var header = file.get_csv_line()
	if header.is_empty():
		printerr("CSV header is empty in: ", ENEMY_CSV_PATH)
		file.close()
		return

	var column_count = header.size()
	# Adding log for expected columns based on header
	print("Expected column count based on header: ", column_count)
	# Explicitly check if header count is 7, as the error suggests
	if column_count != 7:
		printerr("Warning: Header columns count (", column_count, ") is not 7 in ", ENEMY_CSV_PATH)

	var line_number = 1 # Start counting after header
	while not file.eof_reached():
		# Adding log before reading each line
		print("Processing line ", line_number, " in ", ENEMY_CSV_PATH)

		var data = file.get_csv_line()
		var current_line_for_error = line_number # Store line number for potential error message
		line_number += 1

		# Skip empty lines or lines with incorrect column count
		# The original error likely comes from Godot's internal CSV parser when data.size() is wrong
		# But we add our own check/log here as well
		if data.is_empty() or data.size() != column_count:
			# Check for completely empty line often found at the end of CSV files
			if data.size() == 1 and data[0] == "":
				print("Detected empty line at line ", current_line_for_error ," (likely end of file), skipping.")
				continue
			elif not data.is_empty(): # Print warning only if line is not empty but malformed
				# Log the problematic line data
				printerr("Malformed CSV line detected at line ", current_line_for_error, ". Expected ", column_count, " columns, got ", data.size(), ". Data: ", data)
				# The original error you saw might be printed by Godot *before* this printerr,
				# but this log confirms which line caused it in *our* processing logic.
			else: # Handle other empty data cases if necessary
				print("Skipping potentially empty data line ", current_line_for_error, ".")

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

		if not enemy_resource.character_class.is_empty():
			if _enemies.has(enemy_resource.character_class):
				printerr("Duplicate enemy name found in CSV: ", enemy_resource.name, ". Overwriting.")
			_enemies[enemy_resource.character_class] = enemy_resource
		else:
			printerr("Skipping enemy entry with empty character_class at line ", current_line_for_error, ".")

	# Adding log after processing finishes
	print("Finished loading enemies from: ", ENEMY_CSV_PATH)
	file.close() # Ensure file is closed


func get_enemy(enemy_name: String) -> EnemyResource:
	"""
	Retrieves an EnemyResource by its name.
	Returns null if the enemy is not found.
	"""
	print("Getting enemy: ", _enemies)
	return _enemies.get(enemy_name, null)
