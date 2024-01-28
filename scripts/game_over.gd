extends CanvasLayer

func _ready():
	$GameOverMenu/VBoxContainer/TitleMenuButton.grab_focus()

var title_level = preload("res://levels/uipanels/title.tscn")
func _on_title_menu_button_pressed():
	get_tree().change_scene_to_packed(title_level)
	
