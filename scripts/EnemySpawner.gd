class_name EnemySpawner extends Timer

@export var enemy_scene: PackedScene = preload("res://prefabs/placeholder_enemy.tscn")
@export var max_enemies: int = 100

func _ready():
	timeout.connect(spawn)
	start()

func spawn():
	if randi_range(0,max_enemies) > get_child_count():
		var new_enemy = enemy_scene.instantiate()
		new_enemy.find_child("TargetManager").target = get_parent()
		new_enemy.position = Vector2.from_angle(randf_range(-PI,PI)) * new_enemy.find_child("LimitDistanceToTarget").spawn_distance + get_parent().global_position
		add_child(new_enemy)
