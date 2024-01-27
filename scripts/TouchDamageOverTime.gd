class_name TouchDamageOverTime extends Node

@export var dps: float = 20.0

func _physics_process(delta):
	for body in get_parent().get_overlapping_bodies():
		var health = body.find_child("HealthComponent")
		if health:
			health.value -= dps * delta
