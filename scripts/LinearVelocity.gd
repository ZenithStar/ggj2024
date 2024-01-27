class_name LinearVelocity extends Node

@export var velocity: float = 1000.0

func _physics_process(delta):
	get_parent().position += (
		Vector2.from_angle(get_parent().rotation) * velocity * delta
		+ get_parent().additional_velocity_vector * delta
		)
