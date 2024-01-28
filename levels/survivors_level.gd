extends Node

func _ready():
	Upgrades.reinitialize()
	Globals.kill_count = 0
	$HUD.update_upgrade_icons()
