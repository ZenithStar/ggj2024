class_name BlastSpawner extends Timer

@export var projectile_scene: PackedScene = preload("res://prefabs/placeholder_projectile_blast.tscn")
@export var spray_variance: float = PI/16.0
@export var velocity: float = 300.0

func _ready():
	timeout.connect(spawn)
	start()

func spawn():
	var new_proj = projectile_scene.instantiate()
	new_proj.rotation = get_parent().rotation + PI/2
	new_proj.position = $"../SpawnPointRight".global_position
	get_parent().velocity -= Vector2.from_angle(new_proj.rotation) * velocity
	add_child(new_proj)
