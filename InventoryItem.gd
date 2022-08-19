extends Panel

onready var inventory = get_node("/root/Node2D/Inventory/InventoryList")

func _on_TextureButton_pressed():
	inventory.updateSelection(name)

func setSelected(selected: bool):
	if (selected):
		modulate = Color.blueviolet
	else:
		modulate = Color.white
