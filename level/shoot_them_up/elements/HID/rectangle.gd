extends Node2D

export(Color) var stroke_color = Color(0, 0, 0) setget set_stroke_color
export(Color) var fill_color = Color(255, 255, 255) setget set_fill_color
export(Vector2) var size = Vector2(0, 0) setget set_size
export(float) var stroke_width = 1 setget set_stroke_width

func _draw_extended_line(from, to, stroke_color, stroke_width):
	if from.x == to.x:
		# Vertical line
		var begin = min(from.y, to.y)
		var end   = max(from.y, to.y)
		
		draw_line(
			Vector2(from.x, begin - stroke_width/2),
			Vector2(to.x, end + stroke_width/2),
			stroke_color,
			stroke_width
		)
	elif from.y == to.y:
		# Horizontal line
		var begin = min(from.x, to.x)
		var end   = max(from.x, to.x)
		
		draw_line(
			Vector2(begin - stroke_width/2, from.y),
			Vector2(end + stroke_width/2, to.y),
			stroke_color,
			stroke_width
		)
		

func _draw():	
	var points = [
		Vector2(0, 0),
		Vector2(size.x, 0),
		Vector2(size.x, size.y),
		Vector2(0, size.y),
	]
	
	draw_polygon(points, [fill_color, fill_color, fill_color, fill_color])
	
	for i in range(1 , points.size()):
		_draw_extended_line(points[i-1] , points[i], stroke_color , stroke_width)
	_draw_extended_line(points[points.size() - 1] , points[0], stroke_color , stroke_width)

func set_stroke_color(color):
	stroke_color = color
	update()

func set_fill_color(color):
	fill_color = color
	update()

func set_size(vec):
	size = vec
	update()

func set_stroke_width(width):
	stroke_width = width
	update()
