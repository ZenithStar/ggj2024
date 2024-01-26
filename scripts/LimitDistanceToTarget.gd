class_name LimitDistanceToTarget extends Node

@export var target: Node
@export var max_distance: float:
	get:
		return margin + spawn_distance
	set(value):
		spawn_distance = value - margin
@export var margin: float = 100.0
@export var spawn_distance: float = 1200.0

func _physics_process(_delta):
	if target:
		var offset = get_parent().global_position - target.global_position
		if offset.length() > max_distance: # teleport to the opposite side
			get_parent().global_position = target.global_position - offset.normalized() * spawn_distance
