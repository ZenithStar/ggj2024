extends CanvasLayer

var upgrade_select_panel: PackedScene = preload("res://prefabs/upgrade_selection.tscn")
var upgrade_icon_panel: PackedScene = preload("res://prefabs/upgrade_icon.tscn")

var player
var pause_menu
var clock: Clock
var experience: ExperienceAccumulator

func _ready():
	player = get_tree().root.find_child("Player", true, false)
	pause_menu = get_tree().root.find_child("PauseMenuOverlay", true, false)
	clock = player.find_child("Clock")
	clock.timeout.connect(update_clock)
	experience = player.find_child("ExperienceAccumulator")
	experience.changed.connect(update_exp)
	update_exp()
	experience.level_up.connect(level_up)
	Globals.kill_count_changed.connect(update_kill_count)
	for i in 3:
		get_node("Control/VBoxContainer/LevelUp/MarginContainer/UpgradesSelection/UpgradeSelection%d"%[i]).pressed.connect(resume.bind(i))

func update_clock():
	$Control/VBoxContainer/PanelContainer/ClockLabel.text = clock.time_string()

func update_exp():
	$Control/VBoxContainer/ProgressBar.value = experience.current_exp / experience.get_exp_to_level() * 100.0
	$Control/VBoxContainer/ProgressBar/LevelLabel.text = "Level: %d "%[experience.level+1]

func level_up(_level:int):
	var upgrades = Upgrades.get_available_upgrades()
	upgrades.shuffle()
	for i in 3:
		var button = get_node("Control/VBoxContainer/LevelUp/MarginContainer/UpgradesSelection/UpgradeSelection%d"%[i])
		button.property_name = upgrades[i]
	GuiTransitions.update()
	get_tree().paused = true
	pause_menu.enabled = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GuiTransitions.show.call_deferred("level_up_options")
	$Control/VBoxContainer/LevelUp/MarginContainer/UpgradesSelection.get_child(0).grab_focus()

func resume(index):
	Upgrades.level_up(Upgrades.get_available_upgrades()[index])
	update_upgrade_icons()
	GuiTransitions.hide("level_up_options")
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	get_tree().paused = false
	pause_menu.enabled = true

func update_upgrade_icons():
	for key in Upgrades.current_levels.keys():
		var panel = $Control/VBoxContainer/PanelContainer/UpgradeIcons.find_child(key.to_pascal_case(), false, false)
		if panel:
			panel.update()
		else:
			var icon = upgrade_icon_panel.instantiate()
			icon.name = key.to_pascal_case()
			icon.property_name = key
			$Control/VBoxContainer/PanelContainer/UpgradeIcons.add_child(icon)

func update_kill_count():
	$Control/VBoxContainer/PanelContainer/KillLabel.text = "Kills: %d "%[Globals.kill_count]
