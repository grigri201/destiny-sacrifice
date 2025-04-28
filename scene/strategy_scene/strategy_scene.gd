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
	# Connect the team_data_changed signal BEFORE the initial sync
	if SceneManager.team_resource and not SceneManager.team_resource.team_data_changed.is_connected(_sync_team_data):
		SceneManager.team_resource.team_data_changed.connect(_sync_team_data)

	_sync_team_data() # Initial sync
	_select_random_magic_cards()
	_generate_test_heroes()

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

func _generate_test_heroes():
	# Clear existing heroes if any
	for child in team_container.get_children():
		child.queue_free()

	# Add 4 test hero UI instances with random hero data
	for i in range(4):
		var hero_instance = hero_ui_scene.instantiate()
		var hero_res = ResourceManager.generate_random_hero() # Generate random hero
		if hero_res: # Check if hero generation was successful
			hero_instance.set_character_resource(hero_res) # Set the resource on the UI
		else:
			printerr("Failed to generate random hero for test slot ", i)
		hero_instance.show_exit_button = false
		team_container.add_child(hero_instance)

func _select_random_magic_cards():
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

	# Limit available_magics to 6
	if available_magics.size() > 6:
		available_magics.resize(6)

	_display_magic_cards()

func _display_magic_cards():
	# Clear existing magic cards from the grid
	for child in magic_card_grid.get_children():
		child.queue_free()

	# Instantiate and add magic cards to the grid
	for i in range(available_magics.size()): # Use index for storing original position
		var magic_res = available_magics[i]
		var card_instance = magic_card_scene.instantiate()
		# Set the magic resource for the card instance
		card_instance.set_magic_resource(magic_res)
		# Store the original index in the store grid
		card_instance.store_index = i
		# Connect reparenting signals
		card_instance.reparent_to_store_requested.connect(_on_magic_card_reparent_to_store)
		card_instance.reparent_to_hand_requested.connect(_on_magic_card_reparent_to_hand)
		# Add the card to the grid (GridContainer handles positioning)
		magic_card_grid.add_child(card_instance)
		# Explicitly move to ensure order if add_child doesn't guarantee it initially
		# or if children were previously removed non-sequentially.
		magic_card_grid.move_child(card_instance, i)

func _on_level_up_button_pressed() -> void:
	# Keep accessing team_resource here to call level_up method
	var team_resource = SceneManager.team_resource
	team_resource.level_up() # This will now trigger the signal via the setter
	# _sync_team_data() # No longer need to call manually here, signal handles it

func _on_refresh_button_pressed() -> void:
	# Refresh should likely only reroll cards still in the store,
	# not affect cards already in the hand. This logic might need adjustment.
	# For now, assume it rerolls everything shown in the store grid.
	_select_random_magic_cards()

# Handler for reparenting card to the store grid
func _on_magic_card_reparent_to_store(card: MagicCard):
	var original_store_index = card.store_index
	if card.get_parent() == magic_card_grid:
		# Already in the grid, ensure position (might be redundant for GridContainer)
		if original_store_index != -1 and original_store_index < magic_card_grid.get_child_count():
			magic_card_grid.move_child(card, original_store_index)
		return

	var current_parent = card.get_parent()
	if current_parent:
		current_parent.remove_child(card)

	magic_card_grid.add_child(card)
	card.parent = magic_card_grid # Manually assign the custom parent variable
	# GridContainer manages layout, but move_child sets sibling index which might matter
	if original_store_index != -1 and original_store_index < magic_card_grid.get_child_count():
		magic_card_grid.move_child(card, original_store_index)
	else:
		# If index is invalid, place it at the end and update its stored index
		card.store_index = magic_card_grid.get_child_count() - 1

	card.hand_index = -1 # Clear hand index
	print("Card %s moved to store at index %d" % [card.magic_resource.name, card.store_index])

# Handler for reparenting card to the hand
func _on_magic_card_reparent_to_hand(card: MagicCard):
	var original_hand_index = card.hand_index
	if card.get_parent() == hand:
		# Already in hand, ensure position
		if original_hand_index != -1 and original_hand_index < hand.get_child_count():
			hand.move_child(card, original_hand_index)
		return

	var current_parent = card.get_parent()
	if current_parent:
		current_parent.remove_child(card)

	hand.add_child(card)
	card.parent = hand # Manually assign the custom parent variable
	# Use move_child to place it at the correct index in HBoxContainer
	if original_hand_index != -1 and original_hand_index < hand.get_child_count():
		hand.move_child(card, original_hand_index)
	else:
		# First time in hand or index lost, place at end and store new index
		card.hand_index = hand.get_child_count() - 1

	card.store_index = -1 # Clear store index
	print("Card %s moved to hand at index %d" % [card.magic_resource.name, card.hand_index])
