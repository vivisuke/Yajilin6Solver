extends ColorRect

const N_HORZ = 6
const N_VERT = 6
const CELL_WIDTH = 81
const BOARD_WIDTH = CELL_WIDTH * N_HORZ

func _draw():
	for h in range(N_HORZ + 1):
		var x = h * CELL_WIDTH
		var w = 1 if h > 0 && h < N_HORZ else 3
		draw_line(Vector2(x, 0), Vector2(x, BOARD_WIDTH), Color.BLACK, w)
		draw_line(Vector2(0, x), Vector2(BOARD_WIDTH, x), Color.BLACK, w)
	pass

func _ready():
	pass # Replace with function body.
func _process(delta):
	pass
