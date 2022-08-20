extends Node2D

onready var inventory = get_node("Inventory/InventoryList")
onready var location = get_node("Location")

var clockPickedUp: bool = false
var picturePickedUp: bool = false
var vasePickedUp: bool = false
var wrenchPickedUp: bool = false

enum DoorState { LOCKED, CLOSED, SEMI_OPEN, OPEN }
var doorState = DoorState.LOCKED

func changeLocation(scene_path):
	var next_scene_resource = load(scene_path)
	var next_scene = next_scene_resource.instance()
	for child in location.get_children(): child.queue_free()
	location.add_child(next_scene)
