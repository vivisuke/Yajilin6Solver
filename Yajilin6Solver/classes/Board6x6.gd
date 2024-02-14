class_name Board6x6

extends Object

const N_HORZ = 6
const N_VERT = 6
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

var ary_board = []

func xyToIX(x, y):		# x, y: [0, N_HORZ)
	return x + (y+1) * ARY_HEIGHT

func _init():
	ary_board.resize(ARY_SIZE)
	make_loop()
	#ary_board[xyToIX(0, 0)] = LINE_RIGHT | LINE_DOWN
	#ary_board[xyToIX(1, 0)] = LINE_LEFT | LINE_DOWN
	#ary_board[xyToIX(0, 1)] = LINE_UP | LINE_DOWN
	#ary_board[xyToIX(1, 1)] = LINE_UP | LINE_RIGHT
	#ary_board[xyToIX(2, 1)] = LINE_LEFT | LINE_DOWN
	#ary_board[xyToIX(0, 2)] = LINE_UP | LINE_RIGHT
	#ary_board[xyToIX(1, 2)] = LINE_LEFT | LINE_RIGHT
	#ary_board[xyToIX(2, 2)] = LINE_LEFT | LINE_UP
	#ary_board[xyToIX(4, 0)] = DOT
	#ary_board[xyToIX(5, 0)] = BLACK
	#ary_board[xyToIX(5, 1)] = DOT
func make_loop():
	ary_board.fill(0)
	ary_board[xyToIX(1, 1)] = LINE_RIGHT | LINE_DOWN
	ary_board[xyToIX(2, 1)] = LINE_LEFT | LINE_RIGHT
	ary_board[xyToIX(3, 1)] = LINE_LEFT | LINE_RIGHT
	ary_board[xyToIX(4, 1)] = LINE_LEFT | LINE_DOWN
	ary_board[xyToIX(1, 2)] = LINE_UP | LINE_DOWN
	ary_board[xyToIX(4, 2)] = LINE_UP | LINE_DOWN
	ary_board[xyToIX(1, 3)] = LINE_UP | LINE_DOWN
	ary_board[xyToIX(4, 3)] = LINE_UP | LINE_DOWN
	ary_board[xyToIX(1, 4)] = LINE_RIGHT | LINE_UP
	ary_board[xyToIX(2, 4)] = LINE_LEFT | LINE_RIGHT
	ary_board[xyToIX(3, 4)] = LINE_LEFT | LINE_RIGHT
	ary_board[xyToIX(4, 4)] = LINE_LEFT | LINE_UP
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
