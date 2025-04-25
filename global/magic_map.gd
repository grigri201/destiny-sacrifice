extends Node

const MAGIC_CSV_PATH = "res://global/resource/magic/magic.csv"
const magic_resource: Script = preload("res://global/resource/magic/magic_resource.gd")
var magic_map: Dictionary = {}

func _ready():
	_load_magics()

func _load_magics():
	var file = FileAccess.open(MAGIC_CSV_PATH, FileAccess.READ)
	if file == null:
		printerr("Failed to open magic CSV file: ", MAGIC_CSV_PATH, " Error: ", FileAccess.get_open_error())
		return

	# Skip header line
	file.get_csv_line()

	while not file.eof_reached():
		var data = file.get_csv_line()
		if data.size() < 4: # Check if the row has enough columns
			if data.size() == 1 and data[0] == "": # Skip empty lines often found at the end of CSVs
				continue
			printerr("Skipping invalid row in ", MAGIC_CSV_PATH, ": ", data)
			continue

		var magic = magic_resource.new()
		magic.key = data[0].strip_edges()
		magic.name = data[1].strip_edges()
		magic.description = data[2].strip_edges()
		if data[3].strip_edges().is_valid_int():
			magic.unlock_level = int(data[3].strip_edges())
		else:
			printerr("Invalid unlock_level '", data[3], "' for magic_resource '", magic.key, "' in ", MAGIC_CSV_PATH)
			magic.unlock_level = 0 # Or handle the error as needed

		if magic_map.has(magic.key):
			printerr("Duplicate magic_resource key found: ", magic.key, " in ", MAGIC_CSV_PATH)
		else:
			magic_map[magic.key] = magic
	file.close()

func get_magic(key: String) -> magic_resource:
	return magic_map.get(key)

# Optional: Function to get all magics
func get_all_magics() -> Dictionary:
	return magic_map.duplicate() # Return a copy to prevent external modification

func get_magic_by_level(level: int) -> Array:
	var magics: Array = []
	for magic in magic_map.values():
		if magic.unlock_level <= level:
			magics.append(magic)
	return magics 