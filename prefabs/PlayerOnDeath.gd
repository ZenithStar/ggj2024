extends Node

func _ready():
	#$"../HealthComponent".death.connect(on_death)
	pass

func on_death():
	$"../AudioStreamPlayer2D".set_stream("assets/player_death.ogg")
	var tween = create_tween().bind_node(self)
	$"../CollisionShape2D".set_deferred("disabled", true)
	tween.tween_method(func(val): $"../Sprite2D".material.set_shader_parameter("dissolve_value", val), 1.0, 0.0, 1.0)
	tween.tween_callback(get_parent().queue_free)
