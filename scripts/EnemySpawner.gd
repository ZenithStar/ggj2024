class_name EnemySpawner extends Timer

@export var enemy_scene: PackedScene = preload("res://prefabs/placeholder_enemy.tscn")
@export var enemy_scene2: PackedScene = preload("res://prefabs/placeholder_enemy2.tscn")
@export var max_enemies: int = 100
var dialogue_bubble_swear: PackedScene = preload("res://prefabs/dialogue_bubble_swear.tscn")
var dialogue_bubble_text: PackedScene = preload("res://prefabs/dialogue_bubble_variable.tscn")

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
		if true_some_percent_of_time(50):
			var swear_bubble = dialogue_bubble_swear.instantiate()
			swear_bubble.scale = Vector2(0.2, 0.2)
			temp_enemy.add_child(swear_bubble)
		else:
			var text_bubble = dialogue_bubble_text.instantiate()
			text_bubble.global_position = temp_enemy.global_position + Vector2(-30, 0)
			text_bubble.scale = Vector2(0.3, 0.3)
			temp_enemy.add_child(text_bubble)
	return temp_enemy
	
func instantiate_enemy2(position: Vector2):
	var temp_enemy = enemy_scene2.instantiate()
	if true_some_percent_of_time(5): 
		if true_some_percent_of_time(50):
			var swear_bubble = dialogue_bubble_swear.instantiate()
			swear_bubble.name = "Dialog"
			swear_bubble.scale = Vector2(0.2, 0.2)
			temp_enemy.add_child(swear_bubble)
		else:
			var text_bubble = dialogue_bubble_text.instantiate()
			text_bubble.name = "Dialog"
			text_bubble.scale = Vector2(0.3, 0.3)
			temp_enemy.add_child(text_bubble)
	return temp_enemy

func spawn():
	if randi_range(0,max_enemies) > get_child_count():
		var new_enemy = instantiate_base_karen() if true_some_percent_of_time(95) else enemy_scene2.instantiate()
		new_enemy.find_child("TargetManager").target = get_parent()
		new_enemy.position = Vector2.from_angle(randf_range(-PI,PI)) * new_enemy.find_child("LimitDistanceToTarget").spawn_distance + get_parent().global_position
		if new_enemy.find_child("Dialog"):
			new_enemy.find_child("Dialog").position = new_enemy.position + Vector2(-30, 0)
		if new_enemy.find_child("GenericShadow"):
			new_enemy.find_child("GenericShadow").position = new_enemy.position + Vector2(-10, -10)
		add_child(new_enemy)
