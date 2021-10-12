extends "res://Code/SeachAlgorithms/BaseSearchAlgorithm.gd"


# NOTE: Since every edge has a cost of 1 in this particular program, branch and
# bound looks more like breadth first and bound

func _init(newGraph2D).(newGraph2D):
	pass

func expand(CP, path):
	var neighbours = graph2D.getUnvisitedNeighbours(path.getLastNode())
	for neighbour in neighbours:
		var pathDuplicate = path.duplicate()
		pathDuplicate.addNode(neighbour)
		pathDuplicate.cost += 1
		CP.push_back(pathDuplicate)
	orderPathsByCost(CP)
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
