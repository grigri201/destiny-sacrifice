extends Control
class_name HeroCard

# Preload the SkillDisplay scene (adjust path if needed)
const SKILL_DISPLAY_SCENE = preload("res://ui/skill_display/skill_display.tscn")
const HERO_RESOURCE = preload("res://global/resource/hero/hero_resource.gd")

@export var character_resource: CharacterResource: set = set_character_resource

@onready var hero_photo: TextureRect = %HeroPhoto
@onready var hero_name: Label = %HeroName
@onready var attack_label: Label = %AttackLabel
@onready var hp_label: Label = %HPLabel
@onready var skill_container: VBoxContainer = %SkillContainer

func _ready():
	# Test: Create a random hero card
	var random_hero = HERO_RESOURCE.create_random_hero()
	set_character_resource(random_hero)

func set_character_resource(new_resource: CharacterResource):
	# Disconnect signals from the old resource if it exists and is valid
	if character_resource and is_instance_valid(character_resource):
		if character_resource.is_connected("attack_changed", Callable(self, "update_card")):
			character_resource.disconnect("attack_changed", Callable(self, "update_card"))
		if character_resource.is_connected("hp_changed", Callable(self, "update_card")):
			character_resource.disconnect("hp_changed", Callable(self, "update_card"))
		# Add disconnections for other relevant signals if CharacterResource has them
		# Example: Check if signals like name_changed, photo_changed, skills_changed exist and disconnect
		# if character_resource.has_signal("name_changed") and character_resource.is_connected("name_changed", Callable(self, "update_card")):
		#   character_resource.disconnect("name_changed", Callable(self, "update_card"))


	character_resource = new_resource

	if character_resource and is_instance_valid(character_resource):
		# Connect signals to update_card
		# Ensure the signals exist before connecting
		if character_resource.has_signal("attack_changed"):
			character_resource.attack_changed.connect(update_card)
		if character_resource.has_signal("hp_changed"):
			character_resource.hp_changed.connect(update_card)
		# Add connections for other relevant signals if CharacterResource has them and they exist
		# Example:
		# if character_resource.has_signal("name_changed"):
		#   character_resource.name_changed.connect(update_card)


	# Update the card display immediately
	# Use call_deferred to ensure nodes are ready if called early
	call_deferred("update_card")

func update_card():
	if not is_node_ready():
		await ready # Ensure nodes are ready before accessing them

	if character_resource:
		hero_name.text = character_resource.name if character_resource.name else "N/A"
		attack_label.text = str(character_resource.attack) if character_resource.attack else "N/A"
		hp_label.text = str(character_resource.HP) if character_resource.HP else "N/A"
		
		if character_resource.photo: # Check if photo is not null
			hero_photo.texture = character_resource.photo
		else:
			hero_photo.texture = null # Or set a default placeholder texture

		# Update skills
		# Clear existing skills
		for child in skill_container.get_children():
			child.queue_free()

		# Add new skills if the scene is loaded and the resource has skills
		if SKILL_DISPLAY_SCENE and character_resource.skills:
			for skill_resource in character_resource.skills: # Assuming character_resource.skills is an array
				var skill_display = SKILL_DISPLAY_SCENE.instantiate()
				skill_container.add_child(skill_display)
				if skill_display.has_method("set_skill_resource"):
					skill_display.set_skill_resource(skill_resource)
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
