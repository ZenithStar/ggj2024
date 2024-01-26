class_name ProjectileSpawner extends Timer

@export var projectile_scene: PackedScene = preload("res://prefabs/placeholder_projectile.tscn")
@export var spray_variance: float = PI/16.0
@export var momentum_reaction_ratio: float = 0.01

func _ready():
	timeout.connect(spawn)
	start()

func spawn():
	var new_proj = projectile_scene.instantiate()
	new_proj.rotation = get_parent().rotation + randf_range(-spray_variance, spray_variance)
	new_proj.position = $"../SpawnPoint".global_position
	get_parent().velocity -= Vector2.from_angle(new_proj.rotation) * new_proj.find_child("LinearVelocity").velocity * momentum_reaction_ratio
	add_child(new_proj)
