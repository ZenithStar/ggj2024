class_name ExperienceAccumulator extends Node

signal level_up(level: int)
signal changed
@export var exp_multi_per_level = 2.0**(1.0/5.0)
@export var base_exp_per_level = 10.0
var _total_exp: float = 0.0

var level: int = 0
var current_exp: float = 0.0:
	set(value):
		_total_exp += value - current_exp
		current_exp = value
		while current_exp >= get_exp_to_level():
			current_exp -= get_exp_to_level()
			level += 1
			level_up.emit(level)
		changed.emit()
		print( "Lvl:%s  %s/%s" %[level, current_exp, get_exp_to_level()])
func get_exp_to_level() -> float:
	return base_exp_per_level * exp_multi_per_level ** level
