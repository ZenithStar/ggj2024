extends Control

#var title_level = preload("res://levels/uipanels/title.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("scroll_animation")
func _notification(what):
	match what:
		NOTIFICATION_VISIBILITY_CHANGED:
			if visible:
				$VBoxContainer/HBoxContainer/ImageContainerPlaceholder/BackToMainMenu.grab_focus()

func _on_back_to_main_menu_pressed():
	get_parent().close_credits()#get_tree().change_scene_to_packed(title_level)
