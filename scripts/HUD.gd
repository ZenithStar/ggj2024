extends CanvasLayer

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
	$Control/VBoxContainer/LevelUp/MarginContainer/HBoxContainer/TextureButton.pressed.connect(resume)
	$Control/VBoxContainer/LevelUp/MarginContainer/HBoxContainer/TextureButton2.pressed.connect(resume)
	$Control/VBoxContainer/LevelUp/MarginContainer/HBoxContainer/TextureButton3.pressed.connect(resume)

func update_clock():
	$Control/VBoxContainer/PanelContainer/ClockLabel.text = clock.time_string()

func update_exp():
	$Control/VBoxContainer/ProgressBar.value = experience.current_exp / experience.get_exp_to_level() * 100.0
	$Control/VBoxContainer/ProgressBar/LevelLabel.text = "Level: %d "%[experience.level+1]

func level_up(_level:int):
	get_tree().paused = true
	pause_menu.enabled = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GuiTransitions.show("level_up_options")
	$Control/VBoxContainer/LevelUp/MarginContainer/HBoxContainer/TextureButton.grab_focus()

func resume():
	GuiTransitions.hide("level_up_options")
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	get_tree().paused = false
	pause_menu.enabled = true
