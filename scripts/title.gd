extends Control

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://levels/survivors_level.tscn")


func _on_instructions_pressed():
	pass#get_tree().change_scene_to_file("res://levels/uipanels/instructions.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://levels/uipanels/credits.tscn")
