extends Control
class_name MagicCard

signal buy_button_pressed(magic_resource: MagicResource)

# Preload the SkillDisplay scene (adjust path if needed)
const SKILL_DISPLAY_SCENE = preload("res://ui/skill_display/skill_display.tscn")

@export var show_magic_button: bool

@export var magic_resource: MagicResource: set = set_magic_resource

@onready var magic_texture: TextureRect = %MagicTexture
@onready var magic_name: Label = %MagicName
@onready var magic_description: Label = %MagicDescription

func set_magic_resource(new_resource: MagicResource):
	magic_resource = new_resource
	call_deferred("update_card")

func update_card() -> void:
	if magic_resource:
		magic_name.text = magic_resource.name
		magic_description.text = magic_resource.description
		magic_description.tooltip_text = magic_resource.description
	else:
		magic_name.text = ""
		magic_description.text = ""
		magic_description.tooltip_text = ""
		magic_texture.texture = null


func _on_buy_button_pressed() -> void:
	buy_button_pressed.emit(magic_resource)
