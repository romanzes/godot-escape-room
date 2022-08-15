extends Node2D

onready var game = get_node("/root/Node2D/")

func _ready():
	if (game.wrenchPickedUp):
		$Wrench.queue_free()
