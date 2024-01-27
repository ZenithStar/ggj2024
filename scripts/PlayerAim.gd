class_name PlayerAim extends Node

func _unhandled_input(event):
	var direction_vector: Vector2 = Vector2.ZERO
	if event is InputEventMouseMotion or event is InputEventScreenDrag or event is InputEventScreenTouch:
		direction_vector = Vector2(event.position) - Vector2(get_viewport().get_visible_rect().size) / 2.0 
		print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
	elif ["left","right","up","down"].any( event.is_action ):
		direction_vector = Input.get_vector("left","right","up","down")
	if direction_vector.length() != 0.0:
		get_parent().rotation = atan2(direction_vector.y, direction_vector.x)
