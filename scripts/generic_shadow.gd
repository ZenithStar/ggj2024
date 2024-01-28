extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	top_level = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_parent().global_position + Vector2(-10, -10)
	pass
