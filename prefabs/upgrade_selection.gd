extends TextureButton

@export var property_name: String:
	set( value ):
		property_name = value
		var data = Upgrades.get_data(property_name)
		$MarginContainer/HFlowContainer/Name.text = data["flavor_name"]
		$MarginContainer/HFlowContainer/Level.text = "Level %s"%[Upgrades.get_next_level(property_name)]
		$MarginContainer/HFlowContainer/PanelContainer/Icon.texture = data["icon"]
		$MarginContainer/HFlowContainer/Tooltip.text = data["tooltip"]
		$MarginContainer/HFlowContainer/Flavor.text = data["flavor_text"]
