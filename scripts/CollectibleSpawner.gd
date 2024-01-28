class_name CollectibleSpawner extends Timer

@export var red_balloon_sc: PackedScene = preload("res://prefabs/red_balloon.tscn")

func _ready():
	timeout.connect(spawn)
	start()

func which_collectible():
	"""Extend if more collectibles are added."""
	return red_balloon_sc.instantiate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn():
	var collectible = which_collectible()
	collectible.find_child("TargetManager").target = get_parent()
	collectible.position = (
		Vector2.from_angle(randf_range(-PI,PI)) * collectible.find_child("LimitDistanceToTarget").spawn_distance 
		+ get_parent().global_position)
	add_child(collectible)
