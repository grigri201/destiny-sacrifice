extends Label

@export var description: String = "placeholder description"

func _ready():
	tooltip_text = description
