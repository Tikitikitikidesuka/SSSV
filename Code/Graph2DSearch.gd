extends Node


var graph2D
var CP = []
var finished : bool

func _init(newGraph2D):
	graph2D = newGraph2D

func _ready():
	pass

func initAmplitud():
	finished = false
	CP = [[graph2D.start]]
	graph2D.getNode(graph2D.start).setVisited(true)

func nextAmplitud():
	if finished:
		return true
	var path = CP.front()
	var lastNodePos = path.back()
	#print(lastNode)
	var lastNode = graph2D.getNode(lastNodePos)
	if lastNode.type == lastNode.Type.END:
		showFinished(CP.pop_front())
		CP = []
		finished = true
		return true
	else:
		var neighbours = graph2D.getUnvisitedNeighbours(lastNodePos)
		#print(neighbours)
		if len(neighbours) > 0:
			graph2D.checkNode(lastNodePos)
			graph2D.getNode(neighbours.front()).setVisited(true)
			CP.push_back(path.duplicate() + [neighbours.front()])
			#print(CP)
		else:
			CP.pop_front()
			#print(CP)

func showFinished(path):
	for node in path:
		graph2D.getNode(node).finalPath = true
