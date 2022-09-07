extends Node2D

onready var PipeTile = preload('res://pipes/PipeTile.tscn')

const INIT_FIELD = [
	[0, 1, 2, 3],
	[4, 5, 6, 7],
	[1, 2, 3, 4],
	[5, 6, 7, 1]
]

var field = []

func _ready():
	field.resize(INIT_FIELD.size())
	for y in INIT_FIELD.size():
		field[y] = []
		field[y].resize(INIT_FIELD[y].size())
		for x in INIT_FIELD[y].size():
			if (INIT_FIELD[y][x] != 0):
				var tile = PipeTile.instance()
				tile.setup(x, y, INIT_FIELD[y][x])
				$Board.add_child(tile)
