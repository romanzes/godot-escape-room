extends Sprite

signal item_collected

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			visible = false
			set_process_input(false)
			emit_signal("item_collected")
