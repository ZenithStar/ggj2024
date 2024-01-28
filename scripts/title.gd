extends Control

var blood = preload("res://prefabs/blood.tscn")
var survivors_level = preload("res://levels/survivors_level.tscn")
#var credits_level = preload("res://levels/uipanels/credits.tscn")
func _ready():
	var hack = blood.instantiate()
	hack.position = get_viewport().get_visible_rect().size
	add_child.call_deferred(hack)
	$"CenterContainer/PanelContainer/ButtonContainer/New Game".grab_focus()

func _notification(what):
	match what:
		NOTIFICATION_VISIBILITY_CHANGED:
			if visible and $"CenterContainer/PanelContainer/ButtonContainer/New Game".is_inside_tree():
				$"CenterContainer/PanelContainer/ButtonContainer/New Game".grab_focus()
				
func _on_new_game_pressed():
	$Loading.visible = true
	get_tree().change_scene_to_packed(survivors_level)


func _on_instructions_pressed():
	pass#get_tree().change_scene_to_file("res://levels/uipanels/instructions.tscn")


func _on_credits_pressed():
	open_credits()
	#get_tree().change_scene_to_packed(credits_level)

func open_credits():
	$MarginContainer.visible = false
	$Credits.visible=true
func close_credits():
	$Credits.visible=false
	$MarginContainer.visible = true
