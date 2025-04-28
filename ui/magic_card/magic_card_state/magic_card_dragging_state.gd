extends MagicCardState

const drag_minimum_threshold := 0.02
# Collision layer bits (assuming layer 10 for hand, 11 for store)
const CARD_DROP_AREA_BIT = 9 # Layer 10
const HAND_DROP_AREA_BIT = 10 # Layer 11
const CARD_DROP_AREA_MASK = 1 << CARD_DROP_AREA_BIT
const HAND_DROP_AREA_MASK = 1 << HAND_DROP_AREA_BIT

var minimum_drag_time_elapsed := false

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		magic_card.reparent(ui_layer)
	magic_card.color.color = Color.NAVY_BLUE
	# Set the collision mask based on where the card is coming from
	if magic_card.is_on_sale: # Came from store, look for hand drop area
		magic_card.set_drop_point_detector_mask(HAND_DROP_AREA_MASK)
		print("Dragging from store, looking for hand drop area (mask: %d)" % HAND_DROP_AREA_MASK)
	else: # Came from hand, look for store drop area
		magic_card.set_drop_point_detector_mask(CARD_DROP_AREA_MASK)
		print("Dragging from hand, looking for card drop area (mask: %d)" % CARD_DROP_AREA_MASK)

	minimum_drag_time_elapsed = false
	var threshold_timer := get_tree().create_timer(drag_minimum_threshold, false)
	threshold_timer.timeout.connect(func(): minimum_drag_time_elapsed = true)

func exit() -> void:
	# Reset mask or set appropriate mask for the resting state?
	# Let's reset it for now. The Base/OnSale states don't need detection.
	magic_card.set_drop_point_detector_mask(0)

func on_input(event: InputEvent) -> void:
	var single_targetd := magic_card.magic_resource.is_single_target()
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	# Use is_action_released for confirmation after dragging
	var confirm = event.is_action_released("left_mouse")

	if mouse_motion:
		magic_card.global_position = magic_card.get_global_mouse_position() - magic_card.pivot_offset
		# Transition to AIMING if needed (existing logic)
		if not magic_card.is_on_sale and single_targetd and magic_card.targets.size() > 0:
			get_viewport().set_input_as_handled()
			transition_requested.emit(self, MagicCardState.State.AIMING)

	if cancel:
		# Return to original state on cancel
		if magic_card.is_on_sale:
			transition_requested.emit(self, MagicCardState.State.ONSALE)
		else:
			transition_requested.emit(self, MagicCardState.State.BASE)
		return
	# Handle drop confirmation
	if minimum_drag_time_elapsed and confirm:
		print("magic_card.targets.size(): ", magic_card.targets.size())
		if magic_card.targets.size() == 0:
			if magic_card.is_on_sale:
				transition_requested.emit(self, MagicCardState.State.ONSALE)
			else:
				transition_requested.emit(self, MagicCardState.State.BASE)
			return
		get_viewport().set_input_as_handled()
		if magic_card.is_on_sale:
			transition_requested.emit(self, MagicCardState.State.BUYING)
		else:
			transition_requested.emit(self, MagicCardState.State.RELEASED)
		return
