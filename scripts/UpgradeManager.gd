class_name UpgradeManager extends Node

enum Scaling{
	ADDITIVE,
	MULTIPLICATIVE,
	EXPONENTIAL
}

var PASSIVE_UPGRADES: Dictionary = {
	"traction" : { "name": "traction", "icon": preload("res://icon.svg"), "flavor_name": "Safety Boots", "flavor_text": "",
			"tooltip": "50% more traction", "scaling": Scaling.EXPONENTIAL, "value_per_level": 1.5, "max_level": 5
		},
	"added_damage" : { "name": "added_damage", "icon": preload("res://icon.svg"), "flavor_name": "Added Damage", "flavor_text": "",
			"tooltip": "5 additional damage per hit", "scaling": Scaling.ADDITIVE, "value_per_level": 5.0, "max_level": 5
		},
	"damage_multiplier" : { "name": "damage_multiplier", "icon": preload("res://icon.svg"), "flavor_name": "Damage Multiplier", "flavor_text": "",
			"tooltip": "50% increased damage", "scaling": Scaling.MULTIPLICATIVE, "value_per_level": 0.5, "max_level": 5
		},
	"rate_of_fire" : { "name": "rate_of_fire", "icon": preload("res://icon.svg"), "flavor_name": "Rate of Fire", "flavor_text": "",
			"tooltip": "5% less delay after abilities", "scaling": Scaling.EXPONENTIAL, "value_per_level": 0.95, "max_level": 5
		},
	"vacuum_range" : { "name": "vacuum_range", "icon": preload("res://icon.svg"), "flavor_name": "Vacuum Range", "flavor_text": "",
			"tooltip": "50% increased pick-up range", "scaling": Scaling.MULTIPLICATIVE, "value_per_level": 0.5, "max_level": 5
		},
	"armor" : { "name": "armor", "icon": preload("res://icon.svg"), "flavor_name": "Armor", "flavor_text": "",
			"tooltip": "10% reduced damage taken", "scaling": Scaling.MULTIPLICATIVE, "value_per_level": -0.1, "max_level": 5
		},
	"max_health" : { "name": "max_health", "icon": preload("res://icon.svg"), "flavor_name": "Max Health", "flavor_text": "",
			"tooltip": "20% increased maximum health", "scaling": Scaling.MULTIPLICATIVE, "value_per_level": 0.2, "max_level": 5
		}
}
var ACTIVE_UPGRADES: Dictionary = {
	"front_spray" : { "name": "front_spray", "icon": preload("res://icon.svg"), "flavor_name": "Special Sauce", "flavor_text": "",
			"tooltip": "lolwat", "scaling": Scaling.EXPONENTIAL, "value_per_level": 1.5, "max_level": 5
		},
}

@onready var _available_upgrades: Array[String] = PASSIVE_UPGRADES.keys() + ACTIVE_UPGRADES.keys()
@onready var current_levels: Dictionary = {}
func get_available_upgrades() -> Array[String]:
	return _available_upgrades
func _init():
	for upgrade in PASSIVE_UPGRADES.keys():
		add_user_signal("%s_changed"%[upgrade])
	for upgrade in ACTIVE_UPGRADES.keys():
		add_user_signal("%s_changed"%[upgrade])
func _ready():
	current_levels["front_spray"] = 1
	
func modify_by(input: float, property_name:String) -> float:
	var modifier = PASSIVE_UPGRADES[property_name]
	var modifier_level:int = current_levels[property_name] if property_name in current_levels else 0
	var output = input
	match modifier["scaling"]:
		Scaling.ADDITIVE:
			output += modifier["value_per_level"] * modifier_level
		Scaling.MULTIPLICATIVE:
			output *= modifier["value_per_level"] * modifier_level
		Scaling.EXPONENTIAL:
			output *= modifier["value_per_level"] ** modifier_level
	return output

