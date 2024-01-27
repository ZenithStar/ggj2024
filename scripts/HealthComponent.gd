class_name HealthComponent extends ProgressBar

signal death

func _ready():
	value = max_value
	visible = false
	value_changed.connect(update)

func update(_new_value):
	visible = value < max_value and value > 0.0
	if value <= 0.0:
		death.emit()
