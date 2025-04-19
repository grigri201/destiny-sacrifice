extends Node2D
class_name Team

@export var slot_prefab: PackedScene
@export var slot_definitions: Dictionary = {}

var _instantiated_slots: Dictionary = {}

func _ready():
	if slot_prefab == null:
		printerr("Team: slot_prefab is not set!")
		return

	for slot_position in slot_definitions:
		if not slot_position is Vector2:
			printerr("Team: Invalid key in slot_definitions. Expected Vector2, got: ", typeof(slot_position))
			continue

		var slot_instance = slot_prefab.instantiate()
		if not slot_instance is Slot:
			printerr("Team: slot_prefab did not instantiate a Slot.")
			if slot_instance != null:
				slot_instance.queue_free()
			continue

		add_child(slot_instance)
		slot_instance.position = slot_position
		slot_instance.type = slot_definitions[slot_position]
		_instantiated_slots[slot_position] = slot_instance

func get_slots_by_type(type: String) -> Array:
	return _instantiated_slots.values().filter(func(slot): return slot.type == type)

func get_all_slots() -> Array:
	return _instantiated_slots.values()

func get_free_slot() -> Slot:
	for slot in _instantiated_slots.values():
		if slot.is_free():
			return slot
	return null
	
