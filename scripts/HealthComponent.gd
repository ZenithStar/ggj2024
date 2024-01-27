class_name HealthComponent extends ProgressBar

@export var on_death: PackedScene

func _ready():
	value = max_value
	visible = false
	value_changed.connect(update)

func update(_new_value):
	visible = value < max_value
	if value <= 0:
		if on_death:
			var death_drop = on_death.instantiate()
			death_drop.position = get_parent().position
			Experience.add_child.call_deferred(death_drop)
		get_parent().queue_free() # change to death animation when that's in
	
