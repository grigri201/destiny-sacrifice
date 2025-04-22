extends Control
class_name HeroCard

signal join_button_pressed(hero_resource: CharacterResource)

# Preload the SkillDisplay scene (adjust path if needed)
const SKILL_DISPLAY_SCENE = preload("res://ui/skill_display/skill_display.tscn")

@export var show_join_button: bool

@export var hero_resource: CharacterResource: set = set_character_resource

@onready var hero_photo: TextureRect = %HeroPhoto
@onready var hero_name: Label = %HeroName
@onready var attack_label: Label = %AttackLabel
@onready var hp_label: Label = %HPLabel
@onready var skill_container: VBoxContainer = %SkillContainer
@onready var join_button: Button = %JoinButton

func set_character_resource(new_resource: CharacterResource):
	# Disconnect signals from the old resource if it exists and is valid
	if hero_resource and is_instance_valid(hero_resource):
		if hero_resource.is_connected("attack_changed", Callable(self, "update_card")):
			hero_resource.disconnect("attack_changed", Callable(self, "update_card"))
		if hero_resource.is_connected("hp_changed", Callable(self, "update_card")):
			hero_resource.disconnect("hp_changed", Callable(self, "update_card"))

	hero_resource = new_resource

	if hero_resource and is_instance_valid(hero_resource):
		# Connect signals to update_card
		# Ensure the signals exist before connecting
		if hero_resource.has_signal("attack_changed"):
			hero_resource.attack_changed.connect(update_card)
		if hero_resource.has_signal("hp_changed"):
			hero_resource.hp_changed.connect(update_card)

	# Update the card display immediately
	# Use call_deferred to ensure nodes are ready if called early
	call_deferred("update_card")

func update_card():
	if not is_node_ready():
		await ready # Ensure nodes are ready before accessing them

	if hero_resource:
		hero_name.text = hero_resource.name if hero_resource.name else "N/A"
		attack_label.text = str(hero_resource.attack) if hero_resource.attack else "N/A"
		hp_label.text = str(hero_resource.HP) if hero_resource.HP else "N/A"
		hero_photo.texture = load("res://art/texture/character/"+ hero_resource.character_class +".tres")

		# Update skills
		# Clear existing skills
		for child in skill_container.get_children():
			child.queue_free()

		# Add new skills if the scene is loaded and the resource has skills
		if SKILL_DISPLAY_SCENE and hero_resource.skills:
			for skill in hero_resource.skills: # Assuming hero_resource.skills is an array
				var skill_display = SKILL_DISPLAY_SCENE.instantiate()
				skill_container.add_child(skill_display)
				if skill_display.has_method("set_skill_resource"):
					skill_display.set_skill_resource(skill)
				else:
					printerr("SkillDisplay scene at %s does not have set_skill_resource method." % SKILL_DISPLAY_SCENE.resource_path)
		elif not SKILL_DISPLAY_SCENE:
			printerr("SkillDisplay scene could not be preloaded. Check the path.")
	else:
		# Set default values if no resource
		hero_name.text = "N/A"
		attack_label.text = "N/A"
		hp_label.text = "N/A"
		hero_photo.texture = null # Or set a default placeholder texture
		# Clear skills if no resource
		for child in skill_container.get_children():
			child.queue_free()


func _on_join_button_pressed() -> void:
	join_button_pressed.emit(hero_resource)
