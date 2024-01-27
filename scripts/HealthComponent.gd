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
		var tween = create_tween().bind_node(self)
		visible = false
		$"../CollisionShape2D".set_deferred("disabled", true)
		tween.tween_method(func(val): $"../Sprite2D".material.set_shader_parameter("dissolve_value", val), 1.0, 0.0, 1.0)
		tween.tween_callback(get_parent().queue_free)
	
