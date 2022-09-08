extends Node2D

signal tile_pressed

var x: int
var y: int
var selected: bool

onready var sprite = get_node("Button/Sprite")

# Class Constructor
func setup(x: int, y: int, type: int):
	var sprite = $Button/Sprite
	match type:
		1:
			sprite.texture = load("res://images/pipe_straight.png")
		2:
			sprite.texture = load("res://images/pipe_straight.png")
			sprite.rotation_degrees = 90
		3:
			sprite.texture = load("res://images/pipe_bent.png")
		4:
			sprite.texture = load("res://images/pipe_bent.png")
			sprite.rotation_degrees = 90
		5:
			sprite.texture = load("res://images/pipe_bent.png")
			sprite.rotation_degrees = 180
		6:
			sprite.texture = load("res://images/pipe_bent.png")
			sprite.rotation_degrees = 270
		7:
			sprite.texture = load("res://images/pipe_crossed.png")
	self.x = x
	self.y = y
	position.x = $Button.rect_size.x * (x + 0.5)
	position.y = $Button.rect_size.y * (y + 0.5)

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
