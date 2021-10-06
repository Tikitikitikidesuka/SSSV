extends Node


var Graph2D = preload("res://Scenes/Graph2D.tscn")
var Graph2DSearch = preload("res://Code/Graph2DSearch.gd")

var data = [
3, 7, 5, 3, 6, 6, 4, 5, 6, 6, 6, 3, 7, 7, 5, 7, 6, 5, 3, 5, 6, 4, 7, 3, 5, 7, 5, 5, 7, 3, 6, 3, 7, 7, 4, 3, 3, 6, 4, 7, 3, 7, 6, 5, 3, 5, 3, 7, 7, 4, 5, 6, 7, 6, 6, 6, 7, 5, 3, 7, 3, 7, 6, 5, 5, 5, 6, 6, 7, 6, 3, 6, 3, 5, 5, 4, 4, 7, 5, 7, 4, 4, 7, 4, 4, 6, 4, 6, 6, 3, 5, 4, 6, 5, 6, 3, 6, 5, 6, 5
	]

var graph2D
var searcher

func _ready():
	graph2D = Graph2D.instance()
	graph2D.init(Vector2(10,10), data)
	add_child(graph2D)
	searcher = Graph2DSearch.new(graph2D)
	searcher.initAmplitud()

var timeCntr = 0.0
var timeInterval = 0.25

func _process(delta):
	if Input.is_action_just_pressed("next"):
		searcher.nextAmplitud()
	elif Input.is_action_pressed("auto_next"):
		timeCntr += delta
		if timeCntr > timeInterval:
			searcher.nextAmplitud()
			timeCntr = 0.0
