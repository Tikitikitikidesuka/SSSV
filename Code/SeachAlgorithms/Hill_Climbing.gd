extends "res://Code/SeachAlgorithms/BaseSearchAlgorithm.gd"


func _init(newGraph2D).(newGraph2D):
	pass

func expand(CP, path):
	var expansion = []
	var neighbours = graph2D.getUnvisitedNeighbours(path.getLastNode())
	for neighbour in neighbours:
		var newPath = path.duplicate()
		newPath.addNode(neighbour)
		newPath.heuristic = neighbour.distance_to(graph2D.end)
		expansion.push_back(newPath)
	orderPathsByHeuristic(expansion)
	appendFrontList(CP, expansion)
