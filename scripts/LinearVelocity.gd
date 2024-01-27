class_name LinearVelocity extends Node

@export var velocity: float = 1000.0
@export var additional_velocity_vector: Vector2
func _physics_process(delta):
	
	get_parent().position += (
		(Vector2.from_angle( get_parent().rotation) 
			* velocity + additional_velocity_vector) * delta
		)
