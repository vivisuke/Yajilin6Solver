extends Node2D

var CBoard6x6 = preload("res://classes/Board6x6.gd")
var bd

func _ready():
	bd = CBoard6x6.new()
	$Board/LineLayer.ary_board = bd.ary_board
	$Board/LineLayer.queue_redraw()
	pass # Replace with function body.


func _process(delta):
	pass
