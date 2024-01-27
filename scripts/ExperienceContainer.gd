class_name ExperienceContainer extends Node

func clear():
	for child in get_children():
		child.queue_free()
