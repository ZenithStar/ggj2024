class_name FloatingDamage extends Node2D

@export var distance: float = 50.0
@export var duration: float = 1.0
var tween: Tween
func _ready():
	tween = create_tween()
	tween.tween_property(self, "global_position:y", global_position.y-distance, duration)
	tween.tween_callback(queue_free)
func set_text(text: String):
	$FloatingDamage.text = text
