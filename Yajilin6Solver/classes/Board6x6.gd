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
var dir_order

func xyToIX(x, y):		# x, y: [0, N_HORZ)
	return x + (y+1) * ARY_WIDTH
func is_line(ix) -> bool:
	return ary_board[ix] > 0
func _init():
	dir_order = [LINE_UP, LINE_DOWN, LINE_LEFT, LINE_RIGHT]
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
# ２セル縦方向ラインを右に１セルずらす
# 前提：ary_board[ix] は空欄
func move_line2_right(ix) -> bool:
	#print("ix = ", ix)
	#print(ary_board[ix+ARY_WIDTH], " ", ary_board[ix-1], " ", ary_board[ix+ARY_WIDTH-1])
	if ary_board[ix+ARY_WIDTH] != EMPTY || !is_line(ix-1) || !is_line(ix+ARY_WIDTH-1):
		return false
	if (ary_board[ix-1] & LINE_DOWN) == 0: return false		# 線分が連続していない場合
	ary_board[ix] = LINE_LEFT | LINE_DOWN
	ary_board[ix+ARY_WIDTH] = LINE_LEFT | LINE_UP
	ary_board[ix-1] ^= LINE_RIGHT | LINE_DOWN
	ary_board[ix+ARY_WIDTH-1] ^= LINE_RIGHT | LINE_UP
	return true
# ２セル縦方向ラインを左に１セルずらす
# 前提：ary_board[ix] は空欄
func move_line2_left(ix) -> bool:
	if ary_board[ix+ARY_WIDTH] != EMPTY || !is_line(ix+1) || !is_line(ix+ARY_WIDTH+1):
		return false
	if (ary_board[ix+1] & LINE_DOWN) == 0: return false		# 線分が連続していない場合
	ary_board[ix] = LINE_RIGHT | LINE_DOWN
	ary_board[ix+ARY_WIDTH] = LINE_RIGHT | LINE_UP
	ary_board[ix+1] ^= LINE_LEFT | LINE_DOWN
	ary_board[ix+ARY_WIDTH+1] ^= LINE_LEFT | LINE_UP
	return true
# ２セル縦方向ラインを上に１セルずらす
# 前提：ary_board[ix] は空欄
func move_line2_up(ix) -> bool:
	if ary_board[ix+1] != EMPTY || !is_line(ix+ARY_WIDTH) || !is_line(ix+ARY_WIDTH+1):
		return false
	if (ary_board[ix+ARY_WIDTH] & LINE_RIGHT) == 0: return false		# 線分が連続していない場合
	ary_board[ix] = LINE_RIGHT | LINE_DOWN
	ary_board[ix+1] = LINE_LEFT | LINE_DOWN
	ary_board[ix+ARY_WIDTH] ^= LINE_RIGHT | LINE_UP
	ary_board[ix+ARY_WIDTH+1] ^= LINE_LEFT | LINE_UP
	return true
# ２セル縦方向ラインを下に１セルずらす
# 前提：ary_board[ix] は空欄
func move_line2_down(ix) -> bool:
	if ary_board[ix+1] != EMPTY || !is_line(ix-ARY_WIDTH) || !is_line(ix-ARY_WIDTH+1):
		return false
	if (ary_board[ix-ARY_WIDTH] & LINE_RIGHT) == 0: return false		# 線分が連続していない場合
	ary_board[ix] = LINE_RIGHT | LINE_UP
	ary_board[ix+1] = LINE_LEFT | LINE_UP
	ary_board[ix-ARY_WIDTH] ^= LINE_RIGHT | LINE_DOWN
	ary_board[ix-ARY_WIDTH+1] ^= LINE_LEFT | LINE_DOWN
	return true
func move_line(ix) -> bool:
	dir_order.shuffle()
	for i in range(dir_order.size()):
		if dir_order[i] == LINE_UP:
			if move_line2_up(ix): return true
		if dir_order[i] == LINE_DOWN:
			if move_line2_down(ix): return true
		if dir_order[i] == LINE_LEFT:
			if move_line2_left(ix): return true
		if dir_order[i] == LINE_RIGHT:
			if move_line2_right(ix): return true
	#move_line2_up(xyToIX(1, 0))
	#move_line2_down(xyToIX(2, 5))
	#move_line2_left(xyToIX(0, 2))
	#move_line2_right(xyToIX(5, 1))
	#move_line2_right(xyToIX(2, 2))
	return false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
