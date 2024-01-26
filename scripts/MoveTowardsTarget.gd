class_name MoveTowardsTarget extends Node

@export var target: Node
@export var velocity: float = 300.0

func _physics_process(delta):
	if target:
		get_parent().look_at(target.global_position)
		get_parent().global_position = get_parent().global_position.move_toward( target.global_position, velocity * delta)
