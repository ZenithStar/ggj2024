extends CanvasLayer

@export var enabled: bool = true
signal paused(bool)
func _enter_tree():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
func _exit_tree():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func pause():
	visible = true
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	paused.emit(true)
	
func unpause():
	visible = false
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	paused.emit(false)

func _unhandled_input(event):
	if enabled and event.is_action("toggle_pause"):
		if event.is_pressed():
			if get_tree().paused:
				unpause()
			else:
				pause()

func _on_button_pressed():
	unpause()

func _on_volume_value_changed(value):
	var bus = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus, value-30.0 )
	if value <= 0:
		AudioServer.set_bus_mute(bus, true)
	else:
		AudioServer.set_bus_mute(bus, false)
		


func _on_title_menu_button_pressed():
	Experience.clear()
	get_tree().change_scene_to_file("res://levels/uipanels/title.tscn")
	
