class_name BasicMotion extends Node

@export var drag: float = 10.0

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta):
	velocity = velocity.move_toward(Vector2.ZERO, drag*delta*velocity.length())
	get_parent().position += velocity * delta
