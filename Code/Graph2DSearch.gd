extends Object


const Graph2DPath = preload("res://Code/Graph2DPath.gd")

var algorithm

var graph2D
var CP = []
var finished : bool
var prevTempPath : Array

func _init(newGraph2D):
	graph2D = newGraph2D

func _ready():
	pass

func distance(from:Vector2, to:Vector2):
	return (to - from).length()

func initAlgorithm(newAlgorithm):
	# Set algorithm variables
	finished = false
	algorithm = newAlgorithm.new(graph2D)
	# Create first path
	var firstPath = Graph2DPath.new()
	firstPath.addNode(graph2D.start)
	# Reset CP and add first path
	CP = []
	CP.push_back(firstPath)
	graph2D.getNode(graph2D.start).setVisited(true)

func nextStep():
	if finished:
		return false
	# Fetch path to evaluate
	var path = CP.pop_front()
	var lastNodePos = path.getLastNode()
	var lastNode = graph2D.getNode(lastNodePos)
	# Expand the evaluated path
	graph2D.showPath(path.getList())
	graph2D.getNode(lastNodePos).setVisited(true)
	graph2D.checkNode(lastNodePos)
	algorithm.expand(CP, path)
	# Check if the algorithm has finished
	if lastNode.type == lastNode.Type.END or len(CP) == 0:
		graph2D.uncheckNode()
		graph2D.showPath(path.getList(), true)
		finished = true
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

func nextBestFirst():
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

func showPath(path, newFinished = false):
	graph2D.showPath(path, newFinished)

func showFinished(path):
	showPath(path, true)
