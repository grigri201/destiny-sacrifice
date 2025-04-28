extends Node
class_name MagicCardState

signal transition_requested(from: MagicCardState, to: State)

enum State {
	BASE,
	CLICKED,
	DRAGGING,
	AIMING,
	ONSALE,
	RELEASED,
	BUYING,
}

@export var state: State

var magic_card: MagicCard

func enter() -> void:
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass

func on_mouse_exited() -> void:
	pass
