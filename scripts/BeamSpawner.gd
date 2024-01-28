class_name BeamSpawner extends Timer

@export var projectile_scene: PackedScene = preload("res://prefabs/placeholder_projectile_beam.tscn")
@export var level_scaling: float  = 1.0

func _ready():
	timeout.connect(spawn)
	Upgrades.connect("left_beam_changed", _upgrade_weapon)
	set_wait_time( 1.0 / level_scaling)

func spawn():
	var new_proj = projectile_scene.instantiate()
	wait_time = (1.0 / (new_proj.find_child("WeaponProp").rate_of_fire))
	new_proj.rotation = get_parent().rotation - PI/2 + randf_range(-(new_proj.find_child("WeaponProp").spray_variance), new_proj.find_child("WeaponProp").spray_variance)
	new_proj.position = $"../SpawnPointLeft".global_position
	new_proj.find_child("LinearVelocity").additional_velocity_vector = get_parent().velocity
	get_parent().velocity -= Vector2.from_angle(new_proj.rotation) * new_proj.find_child("LinearVelocity").velocity * new_proj.find_child("WeaponProp").momentum_reaction_ratio
	add_child(new_proj)

func _upgrade_weapon():
	if is_stopped:
		start()
	set_wait_time( 1.0 / (Upgrades.get_current_level("left_beam") * level_scaling ) )
