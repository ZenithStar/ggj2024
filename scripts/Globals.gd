extends Node

signal kill_count_changed
@onready var kill_count: int = 0:
	set(value):
		kill_count = value
		kill_count_changed.emit()
	
