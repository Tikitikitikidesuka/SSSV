extends Object


var graph2D

func _ready():
	pass

func _init(newGraph2D):
	graph2D = newGraph2D

func orderPathsByHeuristic(paths:Array):
	paths.sort_custom(PathSorter, "sort_heuristic_ascending")

func orderPathsByCost(paths:Array):
	paths.sort_custom(PathSorter, "sort_cost_ascending")

func orderPathsByCostAndHeuristic(paths:Array):
	paths.sort_custom(PathSorter, "sort_costheursitic_ascending")

class PathSorter:
	static func sort_heuristic_ascending(a, b):
		if a.heuristic < b.heuristic:
			return true
		return false
	
	static func sort_cost_ascending(a, b):
		if a.cost < b.cost:
			return true
		return false
	
	static func sort_costheursitic_ascending(a, b):
		if a.cost + a.heuristic < b.cost + b.heuristic:
			return true
		return false

func printCP(CP):
	for path in CP:
		print(str(path.getLastNode()) + " " + str(path.heuristic))

# Godot does not provide append_array to front method on Array
func appendToFront(list, append):
	for index in range(len(append)-1, -1, -1):
		list.push_front(append[index])
