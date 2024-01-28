extends TextureButton

@export var property_name: String

func _ready():
	var data = Upgrades.get_data(property_name)
	$MarginContainer/HFlowContainer/Name.text = data["flavor_name"]
	$MarginContainer/HFlowContainer/Icon.texture = data["icon"]
	$MarginContainer/HFlowContainer/Tooltip.text = data["tooltip"]
	$MarginContainer/HFlowContainer/Flavor.text = data["flavor_text"]
