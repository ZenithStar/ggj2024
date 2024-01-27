extends CanvasLayer

var _player
var _clock: Clock
var _experience: ExperienceAccumulator
func _ready():
	_player = get_tree().root.find_child("Player", true, false)
	_clock = _player.find_child("Clock")
	_clock.timeout.connect(update_clock)
	_experience = _player.find_child("ExperienceAccumulator")
	_experience.changed.connect(update_exp)
	
func update_clock():
	$Control/VBoxContainer/CenterContainer/ClockLabel.text = _clock.time_string()

func update_exp():
	$Control/VBoxContainer/ProgressBar.value = _experience.current_exp / _experience.get_exp_to_level() * 100.0
	$Control/VBoxContainer/ProgressBar/LevelLabel.text = "Level: %d"%[_experience.level+1]
