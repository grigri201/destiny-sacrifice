extends Control
class_name MagicCard

signal buy_button_pressed(magic_resource: MagicCardResource)
signal reparent_to_hand_requested(which_card: MagicCard)
signal reparent_to_store_requested(which_card: MagicCard)

# Preload the SkillDisplay scene (adjust path if needed)
const SKILL_DISPLAY_SCENE = preload("res://ui/skill_display/skill_display.tscn")

@export var show_magic_button: bool

@export var magic_resource: MagicCardResource: set = set_magic_resource

@onready var magic_texture: TextureRect = %MagicTexture
@onready var magic_name: Label = %MagicName
@onready var magic_description: Label = %MagicDescription
@onready var drop_point_detector: Area2D = %DropPointDetector
@onready var magic_card_state_machine: MagicCardStateMachine = $MagicCardStateMachine
@onready var targets: Array[Node] = []

var is_on_sale: bool = true
var parent: Control
var tween: Tween

# for debug
@onready var color: ColorRect = %Color

func _ready():
	magic_card_state_machine.init(self)

func set_magic_resource(new_resource: MagicCardResource):
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

func animate_to_position(new_position: Vector2, duration: float) -> void:
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_position, duration)

func _on_buy_button_pressed() -> void:
	buy_button_pressed.emit(magic_resource)

func _input(event: InputEvent) ->void:
	magic_card_state_machine.on_input(event)

func _on_gui_input(event:InputEvent) -> void:
	magic_card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	magic_card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	magic_card_state_machine.on_mouse_exited()

func _on_drop_point_detector_area_exited(area:Area2D) -> void:
	if not targets.has(area):
		targets.append(area)

func _on_drop_point_detector_area_entered(area:Area2D) -> void:
	targets.erase(area)