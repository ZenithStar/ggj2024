extends Node

func _ready():
	$"../HealthComponent".death.connect(on_death)

func on_death():
	$"../AudioStreamPlayer2D".set_stream(AudioStreamOggVorbis.load_from_file("res://assets/player_death.ogg"))
	$"../AudioStreamPlayer2D".play()
	var tween = create_tween().bind_node(self)
	$"../CollisionShape2D".set_deferred("disabled", true)
	tween.tween_method(func(val): $"../Icon".material.set_shader_parameter("dissolve_value", val), 1.0, 0.0, 1.0)
	tween.tween_callback(get_parent().queue_free)
