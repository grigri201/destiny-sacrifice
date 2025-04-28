extends Node

# magic card
signal magic_card_aim_started(magic_card: MagicCard)
signal magic_card_aim_ended(magic_card: MagicCard)

# 战斗阶段
signal battle_started
signal battle_ended

# 策略阶段
signal strategy_started
signal strategy_ended

# 行动
signal before_attack(source: Character, target: Character)
signal after_attack(source: Character, target: Character)
signal before_hurt(source: Character, opponent: Character)
signal after_hurt(source: Character, opponent: Character)

# 角色
signal character_died(character: CharacterResource)
signal character_level_up(character: CharacterResource)
