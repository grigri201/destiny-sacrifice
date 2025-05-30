extends Node

const SKILL_CSV_PATH = "res://global/resource/skill/skills.csv"
const skill_resource: Script = preload("res://global/resource/skill/skill_resource.gd")
var skill_map: Dictionary = {}

func _ready():
	_load_skills()

func _load_skills():
	var file = FileAccess.open(SKILL_CSV_PATH, FileAccess.READ)
	if file == null:
		printerr("Failed to open skill CSV file: ", SKILL_CSV_PATH, " Error: ", FileAccess.get_open_error())
		return

	# Skip header line
	file.get_csv_line()

	while not file.eof_reached():
		var data = file.get_csv_line()
		if data.size() < 4: # Check if the row has enough columns
			if data.size() == 1 and data[0] == "": # Skip empty lines often found at the end of CSVs
				continue
			printerr("Skipping invalid row in ", SKILL_CSV_PATH, ": ", data)
			continue

		var skill = skill_resource.new()
		skill.key = data[0].strip_edges()
		skill.name = data[1].strip_edges()
		skill.description = data[2].strip_edges()
		if data[3].strip_edges().is_valid_int():
			skill.unlock_level = int(data[3].strip_edges())
		else:
			printerr("Invalid unlock_level '", data[3], "' for skill_resource '", skill.key, "' in ", SKILL_CSV_PATH)
			skill.unlock_level = 0 # Or handle the error as needed

		if skill_map.has(skill.key):
			printerr("Duplicate skill_resource key found: ", skill.key, " in ", SKILL_CSV_PATH)
		else:
			skill_map[skill.key] = skill
	file.close()

func get_skill(key: String) -> skill_resource:
	return skill_map.get(key)

# Optional: Function to get all skills
func get_all_skills() -> Dictionary:
	return skill_map.duplicate() # Return a copy to prevent external modification

func get_skill_by_level(level: int) -> Array:
	var skills: Array = []
	for skill in skill_map.values():
		if skill.unlock_level <= level:
			skills.append(skill)
	return skills
