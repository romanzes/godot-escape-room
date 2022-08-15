extends Node2D

onready var game = get_node("/root/Node2D/")

func _ready():
	if (game.clockPickedUp):
		$Clock.queue_free()
