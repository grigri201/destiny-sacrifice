extends Node2D
class_name StrategyScene

const hero_ui_scene = preload("res://ui/hero_ui/hero_ui.tscn") # Added
const magic_card_scene = preload("res://ui/magic_card/magic_card.tscn") # Added preload for magic card
var available_magics = []

@onready var team_container: VBoxContainer = %TeamContainer
@onready var magic_card_grid: GridContainer = %MagicCardGrid
@onready var hand: HBoxContainer = %Hand
@onready var level_label: Label = %LevelLabel
@onready var gold_label: Label = %GoldLabel
@onready var level_up_button: Button = %LevelUpButton

func _ready():
	_sync_team_data()
	_select_and_print_random_magic_cards()

func _sync_team_data():
	# Get data from SceneManager using getters
	var gold = SceneManager.get_gold() # Use getter
	var level = SceneManager.get_level() # Use getter

	# Update Labels
	level_label.text = "Level: %d" % level
	gold_label.text = str(gold)

	# Hide level up button if level is 6 or more
	if level >= 6:
		level_up_button.visible = false
	else:
		level_up_button.visible = true

func _select_and_print_random_magic_cards():
	var team_level = SceneManager.get_level() # Use getter
	var all_magics = MagicMap.get_all_magics().values() # Get magic resources as an array

	# Clear previous available magics before filtering again
	available_magics.clear()

	# Filter magics based on unlock_level
	for magic in all_magics:
		if magic.unlock_level and magic.unlock_level <= team_level:
			available_magics.append(magic)

	# Shuffle the available magics
	available_magics.shuffle()

	# Select up to 6 magics (no need to create a new array here)
	# var selected_magics = [] # Removed this line
	# var count = min(6, available_magics.size()) # Removed this line
	# for i in range(count): # Removed this loop
	# 	selected_magics.append(available_magics[i]) # Removed this line

	# Limit available_magics to 6
	if available_magics.size() > 6:
		available_magics.resize(6)

	# Display the selected magic cards in the grid
	_display_magic_cards()

func _display_magic_cards():
	# Clear existing magic cards from the grid
	for child in magic_card_grid.get_children():
		child.queue_free()

	# Instantiate and add magic cards to the grid
	for magic_res in available_magics:
		var card_instance = magic_card_scene.instantiate()
		magic_card_grid.add_child(card_instance)
		# Set the magic resource for the card instance
		card_instance.set_magic_resource(magic_res)
		# Connect the buy button signal
		card_instance.buy_button_pressed.connect(buy_magic)

# Add the new function to handle buying magic
func buy_magic(magic_resource: MagicCardResource) -> void:
	# Implement logic to buy the magic here
	# For example, check gold, add magic to player's inventory, update UI, etc.
	print("Buying magic: ", magic_resource.name) 
	var current_gold = SceneManager.get_gold()
	# Assuming a placeholder cost for now, replace with actual logic
	var magic_cost = 10 # Example cost, you should probably get this from magic_resource
	if current_gold >= magic_cost:
		SceneManager.set_gold(current_gold - magic_cost)
		# Add the magic card resource to the player's data via SceneManager
		SceneManager.add_magic_card(magic_resource) 
		_sync_team_data() # Update UI (like gold display)

		# Find and remove the purchased card from the grid
		for card_node in magic_card_grid.get_children():
			if card_node is MagicCard and card_node.magic_resource == magic_resource:
				card_node.queue_free()
				break # Assuming only one card instance per resource in the shop
	else:
		print("Not enough gold to buy ", magic_resource.name)

func _on_level_up_button_pressed() -> void:
	# Keep accessing team_resource here to call level_up method
	var team_resource = SceneManager.team_resource
	team_resource.level_up()
	_sync_team_data()

func _on_refresh_button_2_pressed() -> void:
	_select_and_print_random_magic_cards()
