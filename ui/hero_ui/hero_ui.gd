extends Control
class_name HeroUI

signal exit_button_pressed

const HeroUIScene = preload("res://ui/hero_ui/hero_ui.tscn")

var _show_exit_button: bool = true
var character_resource: CharacterResource

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_label: Label = $AnimatedSprite2D/AttackLabel
@onready var hp_label: Label = $AnimatedSprite2D/HPLabel
@onready var exit_button: Button = $ExitButton

static func from_resource() -> Control:
	var instance = HeroUIScene.instantiate()
	return instance

func _process(_delta: float) -> void:
	if _show_exit_button:
		exit_button.show()
	else:
		exit_button.hide()

func set_character_resource(resource: CharacterResource):
	# Assuming animation names match character_class names
	await ready
	print("resource.character_class: ", resource.character_class)
	print("resource.attack: ", resource.attack)
	print("resource.HP: ", resource.HP)
	attack_label.text = str(resource.attack)
	hp_label.text = str(resource.HP)
	character_resource = resource
	animated_sprite.play(resource.character_class)

func _on_exit_button_pressed() -> void:
	exit_button_pressed.emit()
