extends Node2D

const arc_points := 8

@onready var area_2d: Area2D = $Area2D
@onready var arc: Line2D = $CanvasLayer/Arc

var current_card: MagicCard
var targeting := false

func _ready() -> void:
	EventBus.magic_card_aim_started.connect(_on_magic_card_aim_started)
	EventBus.magic_card_aim_ended.connect(_on_magic_card_aim_ended)

func _process(_delta: float) -> void:
	if not targeting:
		return
	area_2d.position = get_local_mouse_position()
	arc.points = _get_points()

func _get_points() -> Array:
	var points := []
	var start := current_card.global_position
	start.x += (current_card.size.x /2)
	var target := get_local_mouse_position()
	var distance := (target - start)

	for i in range(arc_points):
		var t := (1.0 / arc_points) * i
		var x := start.x + (distance.x / arc_points) * i
		var y := start.y + ease_out_cubic(t) * distance.y
		points.append(Vector2(x, y))
	points.append(target)
	return points

func ease_out_cubic(number: float) -> float:
	return 1.0 - pow(1.0 - number, 3.0)

func _on_magic_card_aim_started(card: MagicCard) -> void:
	print("magic_card_aim_started: ", card.magic_resource.name)
	print("is_single_target: ", card.magic_resource.is_single_target())
	if not card.magic_resource.is_single_target():
		return
	targeting = true
	area_2d.monitoring = true
	area_2d.monitorable = true
	current_card = card

func _on_magic_card_aim_ended(_card: MagicCard) -> void:
	print("magic_card_aim_ended: ", _card.magic_resource.name)
	targeting = false
	arc.clear_points()
	area_2d.position = Vector2.ZERO
	area_2d.monitoring = false
	area_2d.monitorable = false
	current_card = null

func _on_area_2d_area_exited(area:Area2D) -> void:
	if not current_card or not targeting:
		return
	current_card.targets.erase(area)

func _on_area_2d_area_entered(area:Area2D) -> void:
	if not current_card or not targeting:
		return
	if not current_card.targets.has(area):
		current_card.targets.append(area)
	