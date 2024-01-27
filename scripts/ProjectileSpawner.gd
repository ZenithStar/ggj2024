class_name ProjectileSpawner extends Timer

@export var projectile_scene: PackedScene = preload("res://prefabs/placeholder_projectile_beam.tscn")

func _ready():
	timeout.connect(spawn)
	start()

func spawn():
	var new_proj = projectile_scene.instantiate()
	wait_time = (1.0 / (new_proj.find_child("WeaponProp").rate_of_fire))
	new_proj.rotation = get_parent().rotation + randf_range(-(new_proj.find_child("WeaponProp").spray_variance), new_proj.find_child("WeaponProp").spray_variance)
	new_proj.position = $"../SpawnPoint".global_position
	new_proj.find_child("LinearVelocity").additional_velocity_vector = get_parent().velocity
	get_parent().velocity -= Vector2.from_angle(new_proj.rotation) * new_proj.find_child("LinearVelocity").velocity * new_proj.find_child("WeaponProp").momentum_reaction_ratio
	add_child(new_proj)
