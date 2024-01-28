class_name HealOnTouch extends Node

@export var healedHP: float = 100

func _physics_process(delta):
	for body in get_parent().get_overlapping_bodies():
		var health = body.find_child("HealthComponent")
		
		if health:
			health.value += healedHP
			get_parent().find_child("GulpSound").play()
			get_parent().visible = false
			get_tree().create_timer(1).timeout.connect(get_parent().queue_free)
