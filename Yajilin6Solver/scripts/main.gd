extends Node2D

const N_HORZ = 6
const N_VERT = 6
const ARY_WIDTH = N_HORZ + 1
const ARY_HEIGHT = N_VERT + 2
const ARY_SIZE = ARY_WIDTH * ARY_HEIGHT

var CBoard6x6 = preload("res://classes/Board6x6.gd")
var bd

func xyToIX(x, y):		# x, y: [0, N_HORZ)
	return x + (y+1) * ARY_WIDTH
func _ready():
	bd = CBoard6x6.new()
	$Board/LineLayer.ary_board = bd.ary_board
	$Board/LineLayer.queue_redraw()
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		var mp = $Board/TileMap.local_to_map($Board/TileMap.get_local_mouse_position())
		print(mp)
		bd.move_line(xyToIX(mp[0], mp[1]))
		$Board/LineLayer.queue_redraw()

func _process(delta):
	pass
