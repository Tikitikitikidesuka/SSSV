extends "res://Code/BaseSearchAlgorithm.gd"


func _init(newGraph2D).(newGraph2D):
	pass

func expand(CP, path):
	var neighbours = graph2D.getUnvisitedNeighbours(path.getLastNode())
	for neighbour in neighbours:
		var pathDuplicate = path.duplicate()
		pathDuplicate.addNode(neighbour)
		CP.push_front(pathDuplicate)
