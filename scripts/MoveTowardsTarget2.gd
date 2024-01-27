class_name MoveTowardsTarget2 extends MoveTowardsTarget

var velocity2: float = 500.0
var stopping_distance = 500

func _physics_process(delta):
	if target:
		var parent_enemy = get_parent()
		parent_enemy.look_at(target.global_position)
		var distance_to_target = (parent_enemy.global_position - target.global_position).length()
		if distance_to_target > stopping_distance:
			parent_enemy.global_position = get_parent().global_position.move_toward(target.global_position, velocity2 * delta)
