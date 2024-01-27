class_name Clock extends Timer

signal minute
var _elapsed: int = 0

func _ready():
	start()
	timeout.connect(tick)

func tick():
	_elapsed += 1
	if _elapsed%60 == 0:
		minute.emit()

func time_string() -> String:
	return "%2s:%02d"%[_elapsed/60,_elapsed%60]
