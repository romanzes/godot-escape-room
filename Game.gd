extends Node2D

onready var Wall1 = preload('res://Wall1.tscn')

func _ready():
	add_child(Wall1.instance())
