class_name LinearVelocity extends Node

@export var velocity: float = 1000.0

func _physics_process(delta):
	var extra_vector = (get_parent().additional_velocity_vector * delta
		if "additional_velocity_vector" in get_parent()
		else Vector2.ZERO)
	
	get_parent().position += (
		Vector2.from_angle(
			get_parent().rotation) * velocity * delta
			+ extra_vector
		)
