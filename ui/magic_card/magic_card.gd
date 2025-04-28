extends Control
class_name MagicCard

signal buy_button_pressed(magic_resource: MagicCardResource)
signal reparent_to_hand_requested(which_card: MagicCard)
signal reparent_to_store_requested(which_card: MagicCard)

# Preload the SkillDisplay scene (adjust path if needed)
const SKILL_DISPLAY_SCENE = preload("res://ui/skill_display/skill_display.tscn")

@export var show_magic_button: bool

@export var magic_resource: MagicCardResource: set = set_magic_resource

# Add index variables
var store_index: int = -1
var hand_index: int = -1

@onready var magic_texture: TextureRect = %MagicTexture
@onready var magic_name: Label = %MagicName
@onready var magic_description: Label = %MagicDescription
@onready var drop_point_detector: Area2D = %DropPointDetector
@onready var magic_card_state_machine: MagicCardStateMachine = $MagicCardStateMachine
@onready var targets: Array[Node] = []

@export var is_on_sale := true
var parent: Control
var tween: Tween

# for debug
@onready var color: ColorRect = $Color

func _ready():
	magic_card_state_machine.init(self)
	# Update card visuals if resource is set on initialization
	if magic_resource:
		update_card()

func set_magic_resource(new_resource: MagicCardResource):
	magic_resource = new_resource
	# Reset indices when resource changes, though this might need refinement
	# depending on when resources are set vs. when cards are placed.
	# For now, let's assume indices are set when added to containers.
	# store_index = -1 
	# hand_index = -1
	# Don't call update_card here, wait for _ready or explicit calls
	# Ensure card updates if it's already ready when the resource is changed later
	if is_node_ready():
		update_card()

func update_card() -> void:
	# Ensure node is ready before accessing @onready vars
	if not is_node_ready():
		await ready # Wait until the node is ready
	if magic_resource:
		# Check if nodes are valid before accessing them
		if magic_name:
			magic_name.text = magic_resource.name
		if magic_description:
			magic_description.tooltip_text = magic_resource.description
		# Load texture based on key
		var texture_path = "res://art/skill_icon/{key}.png".format({"key": magic_resource.key})
		var loaded_texture = load(texture_path)
		if magic_texture:
			magic_texture.texture = loaded_texture
	else:
		# Check if nodes are valid before clearing them
		if magic_name:
			magic_name.text = ""
		if magic_description:
			magic_description.tooltip_text = ""
		if magic_texture:
			magic_texture.texture = null
func set_drop_point_detector_mask(mask_index: int) -> void:
	if drop_point_detector:
		drop_point_detector.collision_mask = mask_index

func animate_to_position(new_position: Vector2, duration: float) -> void:
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_position, duration)

func _input(event: InputEvent) ->void:
	magic_card_state_machine.on_input(event)

func _on_gui_input(event:InputEvent) -> void:
	magic_card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	magic_card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	magic_card_state_machine.on_mouse_exited()

func _on_drop_point_detector_area_exited(area:Area2D) -> void:
	targets.erase(area)

func _on_drop_point_detector_area_entered(area:Area2D) -> void:
	if not targets.has(area):
		targets.append(area)
