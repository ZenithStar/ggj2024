class_name EnemyProjectileSpawner extends Timer

@export var projectile_scene: PackedScene = preload("res://prefabs/enemy_projectile.tscn")

func _ready():
	timeout.connect(spawn)
	start()

func spawn():
	var new_proj = projectile_scene.instantiate()
	new_proj.rotation = get_parent().rotation
	new_proj.position = $"../EnemyProjectileSpawnPoint".global_position
	
	var v = $"../MoveTowardsTarget".velocity2
	var rot = get_parent().rotation
	new_proj.additional_velocity_vector = Vector2(cos(rot)*v,sin(rot)*v)
	
	add_child(new_proj)
