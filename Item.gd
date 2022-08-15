extends Sprite

onready var inventory = get_node("/root/Node2D/Inventory/InventoryList")

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			queue_free()
			inventory.addItem(name)
