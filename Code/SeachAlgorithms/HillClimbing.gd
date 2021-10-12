extends "res://Code/SeachAlgorithms/BaseSearchAlgorithm.gd"


func _init(newGraph2D).(newGraph2D):
	pass

func expand(CP, path):
	var expansion = []
	var neighbours = graph2D.getUnvisitedNeighbours(path.getLastNode())
	for neighbour in neighbours:
		var newPath = path.duplicate()
		newPath.addNode(neighbour)
		newPath.heuristic = distance(neighbour, graph2D.end)
		expansion.push_back(newPath)
	orderPathsByHeuristic(expansion)
	
	for index in range(len(expansion)-1, -1, -1):
		print(index)
		CP.push_front(expansion[index])
		
	printCP(CP)

func distance(from:Vector2, to:Vector2):
	return (to-from).length()
