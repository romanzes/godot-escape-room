extends Node2D

const PipeTile = preload('res://pipes2/PipeTile.tscn')
const PipeColor = preload("res://pipes2/PipeTile.gd").PipeColor
const Direction = preload("res://pipes2/PipeTile.gd").Direction

const INIT_FIELD = [
	[2, 2, 3, 4],
	[6, 1, 3, 1],
	[1, 6, 1, 7],
	[5, 5, 4, 1]
]

const field = []

var selected_tile = Vector2(-1, -1)

func _ready():
	field.resize(INIT_FIELD.size())
	for y in INIT_FIELD.size():
		field[y] = []
		field[y].resize(INIT_FIELD[y].size())
		for x in INIT_FIELD[y].size():
			var tile = PipeTile.instance()
			field[y][x] = tile
			tile.setup(x, y, INIT_FIELD[y][x])
			tile.connect("tile_pressed", self, "_on_tile_pressed")
			$Board.add_child(tile)

func _on_tile_pressed(x, y):
	if (selected_tile.x == -1 || selected_tile.y == -1):
		selected_tile = Vector2(x, y)
		field[y][x].set_selected(true)
	else:
		if (selected_tile.x == x && selected_tile.y == y):
			field[y][x].set_selected(false)
			selected_tile = Vector2(-1, -1)
		else:
			var selected_x = selected_tile.x
			var selected_y = selected_tile.y
			var buffer = field[y][x]
			field[y][x] = field[selected_y][selected_x]
			field[selected_y][selected_x] = buffer
			field[y][x].move_to(x, y)
			field[selected_y][selected_x].move_to(selected_x, selected_y)
			selected_tile = Vector2(-1, -1)
			repaint_pipes()

func repaint_pipes():
	for y in field.size():
		for x in field[y].size():
			for layer in field[y][x].layers:
				layer.color = PipeColor.NEUTRAL
	paint_pipe(PipeColor.YELLOW, 0, 0, Direction.UP)
	for y in field.size():
		for x in field[y].size():
			field[y][x].repaint_layers()

func paint_pipe(color: int, x: int, y: int, direction: int):
	for layer in field[y][x].layers:
		if (layer.start == direction || layer.end == direction):
			layer.color = color
