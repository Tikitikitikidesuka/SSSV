extends Object


var graph2D

func _ready():
	pass

func _init(newGraph2D):
	graph2D = newGraph2D

func orderPathsByHeuristic(paths:Array):
	paths.sort_custom(PathSorter, "sort_ascending")

class PathSorter:
	static func sort_ascending(a, b):
		if a.heuristic < b.heuristic:
			return true
		return false

func printCP(CP):
	for path in CP:
		print(str(path.getLastNode()) + " " + str(path.heuristic))

# Godot does not provite append_array to front method on Array
func appendFrontList(list, append):
	for index in range(len(append)-1, -1, -1):
		list.push_front(append[index])
