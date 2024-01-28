class_name OnHit extends Node

@export var floating_damage: PackedScene = preload("res://prefabs/floating_damage.tscn")
@export var damage_min_range: float = 70.0
@export var damage_max_range: float = 100.0
@export var knockback_distance: float = 25

func _ready():
	get_parent().body_entered.connect(on_hit)
	get_parent().area_entered.connect(on_hit)

func on_hit(object):
	var health: HealthComponent = object.find_child("HealthComponent")
	if not health:
		return

	var damage = randf_range(damage_min_range, damage_max_range)
	health.value -= damage
	var floater = floating_damage.instantiate()
	floater.set_text("%d"%[int(damage)])
	floater.position = get_parent().global_position
	get_parent().add_sibling(floater)
	
	# Knockback
	var rotation = get_parent().rotation
	var knockback_vector = Vector2.from_angle(rotation) * knockback_distance
	var before = object.global_position
	object.global_position = object.global_position + knockback_vector
	var after = object.global_position
	#prints(before, knockback_vector, after)
