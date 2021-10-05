extends Node


var Graph2D = preload("res://Scenes/Graph2D.tscn")

var data = [
	0, 2, 2,
	2, 2, 2,
	2, 2, 1
	]

func _ready():
	var graph2D = Graph2D.instance()
	graph2D.init(Vector2(3,3), data)
	add_child(graph2D)
