extends "res://Code/SeachAlgorithms/BaseSearchAlgorithm.gd"


func _init(newGraph2D).(newGraph2D):
	pass

func expand(CP, path):
	var neighbours = graph2D.getUnvisitedNeighbours(path.getLastNode())
	for neighbour in neighbours:
		var pathDuplicate = path.duplicate()
		pathDuplicate.addNode(neighbour)
		pathDuplicate.heuristic = distance(neighbour, graph2D.end)
		CP.push_back(pathDuplicate)
	orderPathsByHeuristic(CP)

func printCP(CP):
	for path in CP:
		print(path.getLastNode())
		print(path.heuristic)

func distance(from:Vector2, to:Vector2):
	return (to-from).length()
