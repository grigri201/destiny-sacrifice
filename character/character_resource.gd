extends Resource
class_name CharacterResource

signal attack_changed(new_attack: int)
signal hp_changed(new_hp: int)

@export var name: String
@export var character_class: String
@export var type: String

var _attack: int = 0
@export var attack: int:
	get:
		return _attack
	set(value):
		if _attack != value:
			_attack = value
			attack_changed.emit(_attack) # 发出信号

var _hp: int = 0
@export var HP: int:
	get:
		return _hp
	set(new_hp):
		# 可以添加一些逻辑，比如确保 HP 不会低于 0
		if _hp != new_hp:
			_hp = new_hp
			hp_changed.emit(_hp) # 发出信号

func is_alive() -> bool:
	return _hp > 0
