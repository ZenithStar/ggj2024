extends CanvasLayer

var upgrade_select_panel: PackedScene = preload("res://prefabs/upgrade_selection.tscn")

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

func update_clock():
	$Control/VBoxContainer/PanelContainer/ClockLabel.text = clock.time_string()

func update_exp():
	$Control/VBoxContainer/ProgressBar.value = experience.current_exp / experience.get_exp_to_level() * 100.0
	$Control/VBoxContainer/ProgressBar/LevelLabel.text = "Level: %d "%[experience.level+1]

func level_up(_level:int):
	var upgrades = Upgrades.get_available_upgrades()
	upgrades.shuffle()
	for upgrade in upgrades.slice(0,3):
		var button = upgrade_select_panel.instantiate()
		button.property_name = upgrade
		$Control/VBoxContainer/LevelUp/MarginContainer/UpgradesSelection.add_child(button)
		button.pressed.connect(resume)
	GuiTransitions.update()
	get_tree().paused = true
	pause_menu.enabled = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GuiTransitions.show.call_deferred("level_up_options")
	$Control/VBoxContainer/LevelUp/MarginContainer/UpgradesSelection.get_child(0).grab_focus()

func resume():
	GuiTransitions.hide("level_up_options")
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	get_tree().paused = false
	pause_menu.enabled = true
	get_tree().create_timer(1.0).timeout.connect(clear_upgrade_buttons)

func clear_upgrade_buttons():
	for child in $Control/VBoxContainer/LevelUp/MarginContainer/UpgradesSelection.get_children():
		child.queue_free()
