extends VBoxContainer

onready var InventoryItem = preload('res://InventoryItem.tscn')

func addItem(name: String):
	var path;
	match name:
		"Clock":
			path = "res://images/clock_inventory.png"
		"Picture":
			path = "res://images/picture_inventory.png"
		"Vase":
			path = "res://images/vase_inventory.png"
		"Wrench":
			path = "res://images/wrench_inventory.png"
	var item = InventoryItem.instance();
	item.get_node("MarginContainer/TextureButton").texture_normal = load(path)
	add_child(item)
