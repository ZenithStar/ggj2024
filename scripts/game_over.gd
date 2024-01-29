extends CanvasLayer

func _ready():
	Experience.clear()
	get_tree().paused = false
	$GameOverMenu/VBoxContainer/TitleMenuButton.grab_focus()

func _on_title_menu_button_pressed():
	get_tree().change_scene_to_file.call_deferred("res://levels/uipanels/title.tscn")
	
