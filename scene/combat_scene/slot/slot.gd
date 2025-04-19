extends Node2D
class_name Slot

@onready var highlight: Sprite2D = $Highlight

var character: Character
@export_enum("front", "back") var type: String = "front"


func _on_area_2d_mouse_exited() -> void:
	highlight.modulate.a = 0.0

func _on_area_2d_mouse_entered() -> void:
	highlight.modulate.a = 0.3

func is_free() -> bool:
	return character == null
