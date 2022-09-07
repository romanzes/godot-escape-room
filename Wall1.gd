extends Node2D

onready var game = get_node("/root/Node2D/")

func _ready():
	if (game.picturePickedUp):
		$Picture.queue_free()
	if (game.vasePickedUp):
		$Vase.queue_free()
	if (game.doorState != game.DoorState.LOCKED):
		$Lock.queue_free()
	updateDoor()


func _on_Door_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		match (game.doorState):
			game.DoorState.LOCKED:
				game.changeLocation("res://Door_Closeup.tscn")
			game.DoorState.CLOSED:
				game.doorState = game.DoorState.SEMI_OPEN
			game.DoorState.SEMI_OPEN:
				game.doorState = game.DoorState.OPEN
			game.DoorState.OPEN:
				game.doorState = game.DoorState.CLOSED
		updateDoor()

func updateDoor():
	$AnimationPlayer.current_animation = "door_swinging"
	$AnimationPlayer.seek(game.doorState, true)
	$AnimationPlayer.stop(false)


func _on_Window_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		game.changeLocation("res://pipes/PipePuzzle.tscn")
