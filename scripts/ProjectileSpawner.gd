class_name ProjectileSpawner extends Timer

@export var projectile_scene: PackedScene = preload("res://prefabs/placeholder_projectile.tscn")
@export var spray_variance: float = PI/16.0
@export var momentum_reaction_ratio: float = 0.01
@export var level_scaling: float = 5.0
@export var level_offset: float = 5.0

func _ready():
	timeout.connect(spawn)
	Upgrades.connect("front_spray_changed", _upgrade_weapon)
	set_wait_time( 1.0 / (level_offset + level_scaling ) )
	start()

func spawn():
	var new_proj = projectile_scene.instantiate()
	new_proj.rotation = get_parent().rotation + randf_range(-spray_variance, spray_variance)
	new_proj.position = $"../SpawnPointForward".global_position
	new_proj.find_child("LinearVelocity").additional_velocity_vector = get_parent().velocity
	get_parent().velocity -= Vector2.from_angle(new_proj.rotation) * new_proj.find_child("LinearVelocity").velocity * momentum_reaction_ratio
	add_child(new_proj)

func _upgrade_weapon():
	if is_stopped:
		start()
	set_wait_time( 1.0 / (Upgrades.get_current_level("front_spray") * level_scaling ) )
