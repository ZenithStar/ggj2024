extends Node

var blood: PackedScene = preload("res://prefabs/blood.tscn")

func _ready():
	var health = get_parent().get_node("HealthComponent")
	health.hit.connect(generate_blood)
	
func generate_blood():
	var player_particles = blood.instantiate()
	player_particles.one_shot = true
	player_particles.emitting = true
	add_sibling(player_particles)
