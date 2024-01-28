class_name HealthComponent extends ProgressBar

@export var offset: float = 64.0

signal death
signal hit

func _ready():
	top_level = true
	value = max_value
	visible = false
	value_changed.connect(update)

func update(_new_value):
	visible = value < max_value and value > 0.0
	if value <= 0.0:
		death.emit()

	var player_audio: AudioStreamPlayer2D = get_parent().find_child("AudioStreamPlayer2D")
	if player_audio:
		player_audio.play()
		player_audio.pitch_scale = randf_range(0.8, 1.5)
		
	hit.emit()

func _process(_delta):
	global_position = get_parent().global_position + Vector2(-size.x/2.0, -size.y/2.0-offset)
