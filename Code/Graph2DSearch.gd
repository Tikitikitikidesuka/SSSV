extends Node


var graph2D
var CP = []

func _init(newGraph2D):
	graph2D = newGraph2D

func _ready():
	pass

func initAmplitud():
	CP = [[graph2D.start]]
	graph2D.getNode(graph2D.start).setVisited(true)

func nextAmplitud():
	var path = CP.front()
	var lastNode = path.back()
	#print(lastNode)
	graph2D.getNode(lastNode)
	var neighbours = graph2D.getUnvisitedNeighbours(lastNode)
	#print(neighbours)
	if len(neighbours) > 0:
		graph2D.checkNode(lastNode)
		graph2D.getNode(neighbours.front()).setVisited(true)
		CP.push_back(path.duplicate() + [neighbours.front()])
		#print(CP)
	else:
		CP.pop_front()
		#print(CP)
