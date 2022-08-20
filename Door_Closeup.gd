extends Node2D

onready var game = get_node("/root/Node2D/")

func _on_Lock_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		game.doorState = game.DoorState.CLOSED
		$AnimationPlayer.play("lock_opening")

func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name == "lock_opening"):
		$Wall/Lock.queue_free()
		game.changeLocation("res://Wall1.tscn")
