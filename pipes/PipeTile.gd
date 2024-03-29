extends TextureButton

signal tile_pressed

var x: int
var y: int

# Class Constructor
func setup(x: int, y: int, type: int):
	match type:
		1:
			$Sprite.texture = load("res://images/pipe_straight.png")
		2:
			$Sprite.texture = load("res://images/pipe_straight.png")
			$Sprite.rotation_degrees = 90
		3:
			$Sprite.texture = load("res://images/pipe_bent.png")
		4:
			$Sprite.texture = load("res://images/pipe_bent.png")
			$Sprite.rotation_degrees = 90
		5:
			$Sprite.texture = load("res://images/pipe_bent.png")
			$Sprite.rotation_degrees = 180
		6:
			$Sprite.texture = load("res://images/pipe_bent.png")
			$Sprite.rotation_degrees = 270
		7:
			$Sprite.texture = load("res://images/pipe_crossed.png")
	self.x = x
	self.y = y
	rect_position.x = rect_size.x * x
	rect_position.y = rect_size.y * y

func move_to(x: int, y: int):
	self.x = x
	self.y = y
	var new_position = Vector2(rect_size.x * x, rect_size.y * y)
	$Tween.interpolate_property(self, "rect_position", null, new_position, 0.3, Tween.TRANS_QUART, Tween.EASE_OUT)
	$Tween.start()

func _on_Tile_pressed():
	emit_signal("tile_pressed", x, y)
