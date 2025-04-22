extends Node2D
class_name PreparationScene

@onready var hero_card_grid: GridContainer = %HeroCardGrid
@onready var team_container: VBoxContainer = %TeamContainer
@onready var finish_button: Button = %FinishButton

const hero_card_scene = preload("res://ui/hero_card/hero_card.tscn")
const HeroUI = preload("res://ui/hero_ui/hero_ui.gd")
const HeroCard = preload("res://ui/hero_card/hero_card.gd") # Added preload for type checking
const MAX_TEAM_SIZE = 4 # Define the maximum team size

var current_team_resources: Array[CharacterResource] = []

func _ready():
	for i in range(10):
		var card = hero_card_scene.instantiate()
		var hero_res = ResourceManager.generate_random_hero()
		card.set_character_resource(hero_res) # Use the setter function
		hero_card_grid.add_child(card)
		card.join_button_pressed.connect(_join_team)
	_update_ui_states() # Update UI states initially

func _join_team(hero_res: CharacterResource):
	# Check if team is full (redundant check as button state handles this, but good safeguard)
	if team_container.get_child_count() >= MAX_TEAM_SIZE:
		print("Team is full!") # Replace with user-facing feedback if needed
		return

	# Check for duplicates (This check remains important)
	for member in team_container.get_children():
		if member is HeroUI and member.character_resource == hero_res:
			print("Hero is already in the team!") # Replace with user-facing feedback
			return

	# Add hero to the team
	var hero_ui: HeroUI = HeroUI.from_resource()
	hero_ui.set_character_resource(hero_res)
	hero_ui.exit_button_pressed.connect(_remove_from_team.bind(hero_ui)) # Removed hero_res binding as it's accessible via hero_ui_instance
	team_container.add_child(hero_ui)

	# Update UI states
	_update_ui_states()


func _remove_from_team(hero_ui_instance: HeroUI):
	# Remove the hero UI from the team container
	team_container.remove_child(hero_ui_instance)
	hero_ui_instance.queue_free() # Ensure the instance is freed from memory

	# Update UI states
	_update_ui_states()


# Helper function to update the enabled/disabled state of buttons and team list
func _update_ui_states():
	# Rebuild the current team resource list based on the UI elements
	current_team_resources.clear()
	for member in team_container.get_children():
		if member is HeroUI:
			current_team_resources.append(member.character_resource)

	var is_team_full = current_team_resources.size() >= MAX_TEAM_SIZE

	# Update finish button state
	finish_button.disabled = current_team_resources.size() != MAX_TEAM_SIZE

	# Update join buttons on hero cards
	for card in hero_card_grid.get_children():
		if card is HeroCard:
			if card.join_button: # Check if the button exists
				# Disable if team is full OR if this hero is already in the team
				if is_team_full or card.hero_resource in current_team_resources:
					card.join_button.disabled = true
				else:
					card.join_button.disabled = false


func _on_finish_button_pressed() -> void: # Renamed from _on_button_pressed to match signal likely connected in editor
	print("Team finalized: ", current_team_resources.size())
	SceneManager.set_team(current_team_resources)
	print("Team set: ", SceneManager.get_team())
	# SceneManager.go_to_battle_scene()
