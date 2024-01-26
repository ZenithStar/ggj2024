class_name LifeSpan extends Timer

func _ready():
	autostart = true
	one_shot = true
	timeout.connect(get_parent().queue_free)
