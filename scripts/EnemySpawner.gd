class_name EnemySpawner extends Timer

@export var enemy_scene: PackedScene = preload("res://prefabs/placeholder_enemy.tscn")
@export var enemy_scene2: PackedScene = preload("res://prefabs/placeholder_enemy2.tscn")
@export var max_enemies: int = 100
var dialogue_bubble_swear: PackedScene = preload("res://prefabs/dialogue_bubble_swear.tscn")

func _ready():
	timeout.connect(spawn)
	start()
	
func true_some_percent_of_time(percent_of_time):
	var random_number = randi_range(0,100)
	if random_number > 0 and random_number <= percent_of_time: 
		return true
	else: 
		return false
	
func instantiate_base_karen():
	var temp_enemy = enemy_scene.instantiate()
	if true_some_percent_of_time(5): 
		var swear_bubble = dialogue_bubble_swear.instantiate()
		swear_bubble.scale = Vector2(0.2, 0.2)
		temp_enemy.add_child(swear_bubble)
	return temp_enemy

func spawn():
	if randi_range(0,max_enemies) > get_child_count():
		var enemy_rand = randi_range(0, 10)
		var new_enemy = instantiate_base_karen() if enemy_rand < 10 else enemy_scene2.instantiate()
		new_enemy.find_child("TargetManager").target = get_parent()
		new_enemy.position = Vector2.from_angle(randf_range(-PI,PI)) * new_enemy.find_child("LimitDistanceToTarget").spawn_distance + get_parent().global_position
		add_child(new_enemy)
