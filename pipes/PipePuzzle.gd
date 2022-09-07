extends Node2D

onready var PipeTile = preload('res://pipes/PipeTile.tscn')

const INIT_FIELD = [
	[0, 2, 3, 4],
	[6, 1, 3, 1],
	[1, 6, 1, 7],
	[5, 5, 4, 1]
]

const field = []

var hole_x = 0
var hole_y = 0

func _ready():
	field.resize(INIT_FIELD.size())
	for y in INIT_FIELD.size():
		field[y] = []
		field[y].resize(INIT_FIELD[y].size())
		for x in INIT_FIELD[y].size():
			var type = INIT_FIELD[y][x]
			if (type == 0):
				hole_x = x
				hole_y = y
			else:
				var tile = PipeTile.instance()
				field[y][x] = tile
				tile.setup(x, y, type)
				tile.connect("tile_pressed", self, "_on_tile_pressed")
				$Board.add_child(tile)

func _on_tile_pressed(x, y):
	if (x == hole_x):
		if (y < hole_y):
			for tile_y in range(hole_y, y, -1):
				field[tile_y][x] = field[tile_y - 1][x]
				field[tile_y][x].move_to(x, tile_y)
		elif (y > hole_y):
			for tile_y in range(hole_y, y):
				field[tile_y][x] = field[tile_y + 1][x]
				field[tile_y][x].move_to(x, tile_y)
		field[y][x] = null
		hole_x = x
		hole_y = y
	elif (y == hole_y):
		if (x < hole_x):
			for tile_x in range(hole_x, x, -1):
				field[y][tile_x] = field[y][tile_x - 1]
				field[y][tile_x].move_to(tile_x, y)
		elif (x > hole_x):
			for tile_x in range(hole_x, x):
				field[y][tile_x] = field[y][tile_x + 1]
				field[y][tile_x].move_to(tile_x, y)
		field[y][x] = null
		hole_x = x
		hole_y = y
