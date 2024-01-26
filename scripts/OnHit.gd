class_name OnHit extends Node

@export var damage_min_range: float = 25.0
@export var damage_max_range: float = 50.0

func _ready():
	get_parent().body_entered.connect(on_hit)
	get_parent().area_entered.connect(on_hit)

func on_hit(object):
	var health: HealthComponent = object.find_child("HealthComponent")
	if health:
		health.value -= randf_range(damage_min_range, damage_max_range)
	get_parent().queue_free() # change to death effects
