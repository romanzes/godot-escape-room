extends Node2D

onready var game = get_node("/root/Node2D/")

func _ready():
	if (game.picturePickedUp):
		$Picture.queue_free()
	if (game.vasePickedUp):
		$Vase.queue_free()
	$AnimationPlayer.play("door_swinging")
