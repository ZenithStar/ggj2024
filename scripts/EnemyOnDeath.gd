class_name EnemyOnDeath extends Node
# TODO: Rename this to be just "OnDeath" because we can use it for collectible as well

@export var spawn_on_death: PackedScene

func _ready():
	$"../HealthComponent".death.connect(on_death)

func on_death():
	if spawn_on_death:
		var death_drop = spawn_on_death.instantiate()
		death_drop.position = get_parent().position
		Experience.add_child.call_deferred(death_drop)
	if get_node_or_null("../GenericShadow") and $"../GenericShadow".visible:
		$"../GenericShadow".visible = false
	var tween = create_tween().bind_node(self)
	$"../CollisionShape2D".set_deferred("disabled", true)
	tween.tween_method(func(val): $"../Sprite2D".material.set_shader_parameter("dissolve_value", val), 1.0, 0.0, 1.0)
	tween.tween_callback(get_parent().queue_free)
	
