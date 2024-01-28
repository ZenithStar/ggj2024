class_name PlayerUpgrades extends Node

func _ready():
	Upgrades.connect("max_health_changed", _upgrade_max_health)
	Upgrades.connect("armor_changed", _upgrade_armor)
	Upgrades.connect("vacuum_range_changed", _upgrade_vacuum)

func _upgrade_max_health():
	var healthNode = get_node("../HealthComponent")
	healthNode.max_value += Upgrades.modify_by(healthNode.max_health, "max_health")

func _upgrade_armor():
	#Todo implement
	pass
	
func _upgrade_vacuum():
	var vacuumNode = get_node("../ExperienceVacuum")
	vacuumNode.radius += Upgrades.modify_by(vacuumNode.radius, "vacuum_range")
