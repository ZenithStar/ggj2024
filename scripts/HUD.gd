extends CanvasLayer

var player
var clock: Clock
var experience: ExperienceAccumulator
func _ready():
	player = get_tree().root.find_child("Player", true, false)
	clock = player.find_child("Clock")
	clock.timeout.connect(update_clock)
	experience = player.find_child("ExperienceAccumulator")
	experience.changed.connect(update_exp)
	update_exp()

func update_clock():
	$Control/VBoxContainer/PanelContainer/ClockLabel.text = clock.time_string()

func update_exp():
	$Control/VBoxContainer/ProgressBar.value = experience.current_exp / experience.get_exp_to_level() * 100.0
	$Control/VBoxContainer/ProgressBar/LevelLabel.text = "Level: %d "%[experience.level+1]
