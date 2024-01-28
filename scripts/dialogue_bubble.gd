extends Node2D

var karen_messages = [
	"I want to speak to your manager",
	"The customer is always right",
	"That’s unacceptable!",
	"You just lost a loyal customer",
	"Do you know who I am?",
	"That's soooo unprofessional",
	"You'll hear from my lawyer",
	"Why, I've never...",
	"How DARE you!",
	"It is my right to not wear a mask",
	"Bless your heart",
	"Where's my cheese?"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	top_level = true
	if get_node_or_null("ReferenceRect") and get_node("ReferenceRect").get_node_or_null("Label"):
		var selected_text = karen_messages.pick_random()
		get_node("ReferenceRect").get_node("Label").text = selected_text
		
	get_tree().create_timer(5.0).timeout.connect(bubble_fade_out)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = get_parent().global_position + Vector2(-30, 0)
	

func bubble_fade_out():
	var tween = create_tween().bind_node(self)
	#tween.tween_method(func(val): $"Sprite2D".material.set_shader_parameter("dissolve_value", val), 1.0, 0.0, 1.0)
	tween.tween_property(get_parent(), "modulate:a", 0.0, 3.0)
	tween.tween_callback(queue_free)


