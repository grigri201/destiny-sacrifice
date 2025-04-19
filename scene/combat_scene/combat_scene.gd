extends Node2D
class_name BattleScene

@onready var combat_manager: CombatManager = %CombatManager

func _ready():
	combat_manager.init()

func _process(_delta: float) -> void:
	pass