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
	"Bless your heart"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	top_level = true
	if get_node("ReferenceRect") and get_node("ReferenceRect").get_node("Label"):
		var selected_text = karen_messages.pick_random()
		get_node("ReferenceRect").get_node("Label").text = selected_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_parent().global_position + Vector2(-30, 0)

