extends CanvasLayer

func _on_title_menu_button_pressed():
	Experience.clear()
	get_tree().change_scene_to_file("res://levels/uipanels/title.tscn")
	
