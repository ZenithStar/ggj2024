extends PanelContainer

@export var property_name: String:
	set( value ):
		property_name = value
		update()
func update():
	$Label.text = "%d"%[ Upgrades.get_current_level(property_name)]
	$Icon.texture = Upgrades.get_data(property_name)["icon"]

