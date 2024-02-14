extends ColorRect

const N_HORZ = 6
const N_VERT = 6
const CELL_WIDTH = 81
const CW_HALF = CELL_WIDTH/2.0				# セル幅の半分
const BOARD_WIDTH = CELL_WIDTH * N_HORZ
const ARY_WIDTH = N_HORZ + 1
const ARY_HEIGHT = N_VERT + 2
const ARY_SIZE = ARY_WIDTH * ARY_HEIGHT

const BLACK = -2
const WALL = -1
const EMPTY = 0
const LINE_UP = 1
const LINE_RIGHT = 2
const LINE_DOWN = 4
const LINE_LEFT = 8
const DOT = 16

const LN_COL = Color("#80c080")
#const LN_COL = Color.GREEN
#const LN_COL = Color.DARK_GREEN
const LN_WD = 9.0

@export var ary_board = []

func xyToIX(x, y):		# x, y: [0, N_HORZ)
	return x + (y+1) * ARY_HEIGHT

func _draw():
	if !ary_board.is_empty():
		for y in range(N_VERT):
			for x in range(N_HORZ):
				var ix = xyToIX(x, y)
				if ary_board[ix] > 0:
					var px = CELL_WIDTH * (x + 0.5)		# セル中央位置
					var py = CELL_WIDTH * (y + 0.5)		# セル中央位置
					draw_circle(Vector2(px, py), LN_WD/2, LN_COL)
					if (ary_board[ix] & LINE_UP) != 0:
						draw_line(Vector2(px, py), Vector2(px, py-CW_HALF), LN_COL, LN_WD)
					if (ary_board[ix] & LINE_DOWN) != 0:
						draw_line(Vector2(px, py), Vector2(px, py+CW_HALF), LN_COL, LN_WD)
					if (ary_board[ix] & LINE_LEFT) != 0:
						draw_line(Vector2(px, py), Vector2(px-CW_HALF, py), LN_COL, LN_WD)
					if (ary_board[ix] & LINE_RIGHT) != 0:
						draw_line(Vector2(px, py), Vector2(px+CW_HALF, py), LN_COL, LN_WD)
	#var x0 = CELL_WIDTH * 0.5
	#var y0 = CELL_WIDTH * 0.5
	#var x1 = CELL_WIDTH * 1.5
	#var x2 = CELL_WIDTH * 4.5
	#var y1 = CELL_WIDTH * 1.5
	#var y2 = CELL_WIDTH * 4.5
	#var col = Color.DARK_GREEN
	#var w = 9.0
	#draw_line(Vector2(x1, y1), Vector2(x2, y1), col, w)
	#draw_line(Vector2(x1, y2), Vector2(x2, y2), col, w)
	#draw_line(Vector2(x1, y1), Vector2(x1, y2), col, w)
	#draw_line(Vector2(x2, y1), Vector2(x2, y2), col, w)
	#draw_circle(Vector2(x0, y0), w/2, col)
	#draw_circle(Vector2(x1, y1), w/2, col)
	#draw_circle(Vector2(x2, y1), w/2, col)
	#draw_circle(Vector2(x1, y2), w/2, col)
	#draw_circle(Vector2(x2, y2), w/2, col)
func _ready():
	pass # Replace with function body.
func _process(delta):
	pass
