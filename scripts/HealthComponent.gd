class_name HealthComponent extends ProgressBar

@export var offset: float = 64.0
signal death

func _ready():
	value = max_value
	visible = false
	value_changed.connect(update)

func update(_new_value):
	visible = value < max_value and value > 0.0
	if value <= 0.0:
		death.emit()

func _physics_process(_delta):
	rotation = -get_parent().rotation
	position = Vector2(-size.x/2.0, -size.y/2.0-offset).rotated(-get_parent().rotation)
