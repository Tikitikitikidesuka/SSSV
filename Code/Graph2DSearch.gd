extends Node


var graph2D
var CP = []
var finished : bool
var prevTempPath : Array

func _init(newGraph2D):
	graph2D = newGraph2D

func _ready():
	pass

func initAlgorithm():
	finished = false
	CP = [[graph2D.start]]
	graph2D.getNode(graph2D.start).setVisited(true)

func nextAmplitud():
	if finished:
		return false
	var path = CP.front()
	var lastNodePos = path.back()
	var lastNode = graph2D.getNode(lastNodePos)
	if lastNode.type == lastNode.Type.END or len(CP) == 0:
		showFinished(CP.pop_front())
		graph2D.uncheckNode()
		CP = []
		finished = true
	else:
		showPath(path)
		if graph2D.checkingNode != lastNodePos:
				graph2D.checkNode(lastNodePos)
		else:
			var neighbours = graph2D.getUnvisitedNeighbours(lastNodePos)
			if len(neighbours) > 0:
				graph2D.getNode(neighbours.front()).setVisited(true)
				CP.push_back(path.duplicate() + [neighbours.front()])
				print("something")
			else:
				print("nothing")
				CP.pop_front()
	return not finished

func nextProfundidad():
	if finished:
		return false
	var path = CP.front()
	var lastNodePos = path.back()
	var lastNode = graph2D.getNode(lastNodePos)
	if lastNode.type == lastNode.Type.END or len(CP) == 0:
		showFinished(CP.pop_front())
		graph2D.uncheckNode()
		CP = []
		finished = true
	else:
		showPath(path)
		if graph2D.checkingNode != lastNodePos:
				graph2D.checkNode(lastNodePos)
		else:
			var neighbours = graph2D.getUnvisitedNeighbours(lastNodePos)
			if len(neighbours) > 0:
				graph2D.getNode(neighbours.front()).setVisited(true)
				CP.push_front(path.duplicate() + [neighbours.front()])
				print("something")
			else:
				print("nothing")
				CP.pop_front()
	return not finished

func showPath(path, final = false):
	for node in prevTempPath:
		graph2D.getNode(node).tempPath = false
	prevTempPath = path
	if not final:
		for node in path:
			graph2D.getNode(node).tempPath = true
	else:
		for node in path:
			graph2D.getNode(node).finalPath = true

func showFinished(path):
	showPath(path, true)
