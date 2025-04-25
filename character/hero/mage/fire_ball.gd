extends Area2D

signal hit

var opponent: Character

func _on_area_entered(_area:Area2D) -> void:
	hit.emit()
	queue_free()
