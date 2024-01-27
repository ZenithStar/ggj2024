class_name ExperienceVacuum extends Area2D

@export var acceleration: float = 5000.0
@export var radius: float = 200.0:
	set(value):
		radius = value
		$CollisionShape2D.shape.radius = radius

func _physics_process(delta):
	print(get_overlapping_areas())
	for area in get_overlapping_areas ( ):
		var motion = area.find_child("BasicMotion")
		if motion:
			motion.velocity -= (area.global_position - global_position).normalized() * acceleration * delta
