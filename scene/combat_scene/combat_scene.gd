extends Node2D
class_name BattleScene

# Keep the @onready vars if you still need direct access from the scene script,
# but CombatManager now gets them via get_parent().get_node()
@onready var hero_team: Node2D = %HeroTeam 
@onready var enemy_team: Node2D = %EnemyTeam
@onready var combat_manager: CombatManager = %CombatManager

func _ready():
	print("BattleScene: Entering _ready()")

	if not combat_manager:
		printerr("BattleScene: CombatManager node not found!")
		return

	# --- Hero Team Initialization ---
	print("BattleScene: Starting hero team generation...")
	var hero_count = 4 # Example count
	for i in range(hero_count):
		var hero_resource = ResourceManager.generate_random_hero()
		if hero_resource:
			print("BattleScene: Generated hero resource: ", hero_resource.name, " (", hero_resource.character_class, ")")
			combat_manager.add_hero(hero_resource) # CombatManager handles instantiation and positioning
		else:
			printerr("BattleScene: Failed to generate hero resource at index ", i)
	print("BattleScene: Finished hero team generation.")

	# --- Enemy Team Initialization ---
	var enemy_count = 8 # Example count
	var enemy_type = "skeleton" # Example type
	print("BattleScene: Starting enemy team generation...")
	for i in range(enemy_count):
		var enemy_resource = ResourceManager.generate_enemy(enemy_type)
		if enemy_resource:
			# Create unique names or handle potential duplicates if needed
			enemy_resource.name = enemy_type + str(i + 1) 
			print("BattleScene: Generated enemy resource: ", enemy_resource.name)
			combat_manager.add_enemy(enemy_resource) # CombatManager handles instantiation and positioning
		else:
			printerr("BattleScene: Failed to generate enemy resource '", enemy_type, "' at index ", i)
	print("BattleScene: Finished enemy team generation.")

	# Start the battle sequence via CombatManager
	print("BattleScene: Starting battle via CombatManager...")
	combat_manager.start_battle()
	print("BattleScene: Battle sequence initiated.")

	print("BattleScene: Exiting _ready()")

func _process(_delta: float) -> void:
	# The main game loop or specific scene logic can go here.
	# Combat turns are now handled within CombatManager.
	pass
