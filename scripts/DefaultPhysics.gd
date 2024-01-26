class_name DefaultPhysics extends Node

@export var traction: float = 0.1

func _physics_process(delta):
	get_parent().velocity = get_parent().velocity.move_toward(Vector2.ZERO, get_parent().velocity.length() * traction * delta)
	get_parent().move_and_slide()
