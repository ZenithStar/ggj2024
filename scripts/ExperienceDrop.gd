class_name ExperienceDrop extends Node

@export var exp_value: float = 1.0

func _ready():
	get_parent().body_entered.connect(on_body_entered)

func on_body_entered(body):
	# apply exp to character
	get_parent().queue_free()
