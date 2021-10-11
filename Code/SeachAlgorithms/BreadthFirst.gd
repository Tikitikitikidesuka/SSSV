extends Object


var graph2D

func _ready():
	pass

func _init(newGraph2D):
	graph2D = newGraph2D

func expand(CP, path):
	var neighbours = graph2D.getUnvisitedNeighbours(path.getLastNode())
	for neighbour in neighbours:
		var pathDuplicate = path.duplicate()
		pathDuplicate.addNode(neighbour)
		CP.push_back(pathDuplicate)
	print(CP)
