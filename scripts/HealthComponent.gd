class_name HealthComponent extends ProgressBar

func _ready():
	value = max_value
	visible = false
	value_changed.connect(update)

func update(_new_value):
	visible = value < max_value
	if value <= 0:
		get_parent().queue_free() # change to death animation when that's in
		# drop exp
	
