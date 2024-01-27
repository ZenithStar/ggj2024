class_name ExperienceDrop extends Node

@export var exp_value: float = 1.0

func _ready():
	get_parent().body_entered.connect(on_body_entered)

func on_body_entered(body):
	var exp_component = body.find_child("Experience")
	if exp_component:
		exp_component.total_exp += exp_value
		get_parent().queue_free()
