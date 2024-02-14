extends ColorRect

const N_HORZ = 6
const N_VERT = 6
const CELL_WIDTH = 81
const BOARD_WIDTH = CELL_WIDTH * N_HORZ

func _draw():
	var x0 = CELL_WIDTH * 0.5
	var y0 = CELL_WIDTH * 0.5
	var x1 = CELL_WIDTH * 1.5
	var x2 = CELL_WIDTH * 4.5
	var y1 = CELL_WIDTH * 1.5
	var y2 = CELL_WIDTH * 4.5
	var col = Color.DARK_GREEN
	var w = 9.0
	draw_line(Vector2(x1, y1), Vector2(x2, y1), col, w)
	draw_line(Vector2(x1, y2), Vector2(x2, y2), col, w)
	draw_line(Vector2(x1, y1), Vector2(x1, y2), col, w)
	draw_line(Vector2(x2, y1), Vector2(x2, y2), col, w)
	draw_circle(Vector2(x0, y0), w/2, col)
	draw_circle(Vector2(x1, y1), w/2, col)
	draw_circle(Vector2(x2, y1), w/2, col)
	draw_circle(Vector2(x1, y2), w/2, col)
	draw_circle(Vector2(x2, y2), w/2, col)
func _ready():
	pass # Replace with function body.
func _process(delta):
	pass
