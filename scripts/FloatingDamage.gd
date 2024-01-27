class_name FloatingDamage extends Node2D

@export var distance: float = 50.0
@export var duration: float = 1.0
var tween: Tween
func _ready():
	tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(self, "global_position:y", global_position.y-distance, duration)
	tween.parallel().tween_property(self, "scale", Vector2(0.5,0.5), duration)
	tween.parallel().tween_property(self, "modulate:a", 0.2, duration)
	tween.tween_callback(queue_free)
func set_text(text: String):
	$FloatingDamage.text = text
