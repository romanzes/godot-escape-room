extends Node2D

signal tile_pressed

const PipeLayer = preload('res://pipes2/PipeLayer.tscn')

var x: int
var y: int
var selected: bool

enum Direction { UP = 0, RIGHT = 1, DOWN = 2, LEFT = 3 }

class Layer:
	var start: int
	var end: int
	
	func _init(start, end):
		self.start = start
		self.end = end

var layers = []

# Class Constructor
func setup(x: int, y: int, type: int):
	match type:
		1:
			add_layer("res://images/pipe_straight.png")
			layers = [Layer.new(Direction.UP, Direction.DOWN)]
		2:
			add_layer("res://images/pipe_straight.png", 90)
			layers = [Layer.new(Direction.LEFT, Direction.RIGHT)]
		3:
			add_layer("res://images/pipe_bent.png")
			layers = [Layer.new(Direction.DOWN, Direction.RIGHT)]
		4:
			add_layer("res://images/pipe_bent.png", 90)
			layers = [Layer.new(Direction.LEFT, Direction.DOWN)]
		5:
			add_layer("res://images/pipe_bent.png", 180)
			layers = [Layer.new(Direction.UP, Direction.LEFT)]
		6:
			add_layer("res://images/pipe_bent.png", 270)
			layers = [Layer.new(Direction.RIGHT, Direction.UP)]
		7:
			add_layer("res://images/pipe_straight.png")
			add_layer("res://images/pipe_straight.png", 90)
			layers = [
				Layer.new(Direction.UP, Direction.DOWN),
				Layer.new(Direction.LEFT, Direction.RIGHT)
			]
	self.x = x
	self.y = y
	position.x = $Button.rect_size.x * (x + 0.5)
	position.y = $Button.rect_size.y * (y + 0.5)

func add_layer(res: String, rotation: int = 0):
	var sprite = PipeLayer.instance()
	sprite.texture = load(res)
	sprite.rotation_degrees = rotation
	$Button.add_child(sprite)

func move_to(x: int, y: int):
	self.x = x
	self.y = y
	var new_position = Vector2($Button.rect_size.x * (x + 0.5), $Button.rect_size.y * (y + 0.5))
	if (!selected):
		z_index = 1
		$MoveTween.interpolate_property(self, "scale", null, Vector2(0.9, 0.9), 0.3, Tween.TRANS_QUART, Tween.EASE_OUT)
	$MoveTween.interpolate_property(self, "position", null, new_position, 0.3, Tween.TRANS_QUART, Tween.EASE_OUT, 0.3)
	$MoveTween.start()

func set_selected(selected: bool):
	self.selected = selected
	if (selected):
		$ScaleTween.interpolate_property(self, "scale", null, Vector2(0.9, 0.9), 0.3, Tween.TRANS_QUART, Tween.EASE_OUT)
		$ScaleTween.start()
	else:
		$ScaleTween.interpolate_property(self, "scale", null, Vector2(1.0, 1.0), 0.3, Tween.TRANS_QUART, Tween.EASE_OUT)
		$ScaleTween.start()

func _on_Tile_pressed():
	emit_signal("tile_pressed", x, y)


func _on_MoveTween_all_completed():
	z_index = 0
	set_selected(false)
