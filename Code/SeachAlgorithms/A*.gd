extends "res://Code/BaseSearchAlgorithm.gd"


func _init(newGraph2D).(newGraph2D):
	pass

func expand(CP, path):
	var neighbours = graph2D.getUnvisitedNeighbours(path.getLastNode())
	for neighbour in neighbours:
		var pathDuplicate = path.duplicate()
		pathDuplicate.addNode(neighbour)
		# Heurisitc must be at all nodes equal or lower than the cost of getting from that node to the maze's end
		pathDuplicate.heuristic = neighbour.distance_to(graph2D.end)
		pathDuplicate.cost += 1
		CP.push_back(pathDuplicate)
	orderPathsByCostAndHeuristic(CP)
	bound(CP)

# CP must be sorted by cost for bound to work
# Iterates through CP and removes paths that lead to the same node as other with a higher cost
func bound(CP:Array):
	var reachedNodes = []
	for pathIndex in range(len(CP)):
		var path = CP.pop_front()
		var node = path.getLastNode()
		if not reachedNodes.has(node):
			reachedNodes.push_back(node)
			CP.push_back(path)
