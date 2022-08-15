extends VBoxContainer

onready var InventoryItem = preload('res://InventoryItem.tscn')

onready var game = get_node("/root/Node2D/")

func addItem(name: String):
	var path;
	match name:
		"Clock":
			path = "res://images/clock_inventory.png"
			game.clockPickedUp = true
		"Picture":
			path = "res://images/picture_inventory.png"
			game.picturePickedUp = true
		"Vase":
			path = "res://images/vase_inventory.png"
			game.vasePickedUp = true
		"Wrench":
			path = "res://images/wrench_inventory.png"
			game.wrenchPickedUp = true
	var item = InventoryItem.instance();
	item.get_node("MarginContainer/TextureButton").texture_normal = load(path)
	add_child(item)
