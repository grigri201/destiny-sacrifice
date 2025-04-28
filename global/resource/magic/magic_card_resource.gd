extends Resource
class_name MagicCardResource

enum Target {
	SELF,
	SINGLE_HERO,
	ALL_ENEMIES,
	EVERYONE,
}

@export_group("Card Attributes")
@export var key: String
@export var name: String
@export var target: Target
@export var unlock_level: int

@export_group("Card Visuals")
@export var icon: Texture2D
@export var description: String

func is_single_target() -> bool:
	return target == Target.SELF or target == Target.SINGLE_HERO

