extends Node2D

func _process(_delta):
	global_position = get_parent().global_position + Vector2(-10, -10)
