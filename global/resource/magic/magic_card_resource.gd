extends Resource
class_name MagicCardResource

enum Target {
	SINGLE_HERO,
	ALL_HERO,
	ALL_ENEMIES,
	ENVIRONMENT,
}

@export_group("Card Attributes")
@export var key: String
@export var name: String
@export var target: Target
@export var unlock_level: int
@export var price: int

@export_group("Card Visuals")
@export var icon: Texture2D
@export var description: String

func is_single_target() -> bool:
	return target == Target.SINGLE_HERO