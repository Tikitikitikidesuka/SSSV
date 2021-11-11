extends "res://Code/BaseSearchAlgorithm.gd"


func _init(newGraph2D).(newGraph2D):
	pass

func expand(CP, path):
	var neighbours = graph2D.getUnvisitedNeighbours(path.getLastNode())
	for neighbour in neighbours:
		var pathDuplicate = path.duplicate()
		pathDuplicate.addNode(neighbour)
		pathDuplicate.heuristic = neighbour.distance_to(graph2D.end)
		CP.push_back(pathDuplicate)
	orderPathsByHeuristic(CP)
