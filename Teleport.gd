extends Sprite

export (String) var scene_path = null

onready var game = get_node("/root/Node2D/")

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			game.changeLocation(scene_path)
