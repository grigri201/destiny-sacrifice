extends Node
class_name MagicCardStateMachine

@export var initial_state: MagicCardState

var current_state: MagicCardState
var states := {}
var magic_card: MagicCard
var parent: Node

func init(magic_card_node: MagicCard) -> void:
	for child in get_children():
		if child is MagicCardState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.magic_card = magic_card_node
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)

func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()

func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

func _on_transition_requested(from: MagicCardState, to: MagicCardState.State) -> void:
	if from != current_state:
		return
	var new_state: MagicCardState = states[to]
	if not new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
