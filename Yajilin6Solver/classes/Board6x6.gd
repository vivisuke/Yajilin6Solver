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

var ary_board = []

func xyToAix(x, y):		# x, y: [0, N_HORZ)
	return x + (y+1) * ARY_HEIGHT

func _init():
	ary_board.resize(ARY_SIZE)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
