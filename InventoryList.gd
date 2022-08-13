extends VBoxContainer

onready var InventoryItem = preload('res://InventoryItem.tscn')

func _on_Clock_item_collected():
	addItem(load("res://images/clock_inventory.png"))


func _on_Picture_item_collected():
	addItem(load("res://images/picture_inventory.png"))


func _on_Vase_item_collected():
	addItem(load("res://images/vase_inventory.png"))


func _on_Wrench_item_collected():
	addItem(load("res://images/wrench_inventory.png"))

func addItem(resource: Resource):
	var item = InventoryItem.instance();
	item.get_node("MarginContainer/TextureButton").texture_normal = resource
	add_child(item)
