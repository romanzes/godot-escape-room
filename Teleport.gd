extends Sprite

export (String) var scene_path = null

onready var location = get_node("/root/Node2D/Location")

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			var next_scene_resource = load(scene_path)
			var next_scene = next_scene_resource.instance()
			for child in location.get_children(): child.queue_free()
			location.add_child(next_scene)
