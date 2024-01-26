class_name TargetManager extends Node

@export var target: Node:
	set(value):
		target = value
		for node in get_parent().get_children():
			if node != self and "target" in node:
				node.set("target", value)
