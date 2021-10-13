extends Object


const Graph2DPath = preload("res://Code/Graph2DPath.gd")

var algorithm
var algorithmInstance

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
	# Save algorithm used
	algorithm = newAlgorithm
	# Set algorithmInstance
	reset()

func reset():
	# Create and set algorithmInstance
	finished = false
	algorithmInstance = algorithm.new(graph2D)
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
	algorithmInstance.expand(CP, path)
	# Check if the algorithmInstance has finished
	if lastNode.type == lastNode.Type.END or len(CP) == 0:
		graph2D.uncheckNode()
		graph2D.showPath(path.getList(), true)
		finished = true
	return not finished

func showPath(path, newFinished = false):
	graph2D.showPath(path, newFinished)

func showFinished(path):
	showPath(path, true)
