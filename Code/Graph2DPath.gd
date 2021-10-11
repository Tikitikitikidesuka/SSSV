extends Object

var weight : float = 0
var list = []

func addNode(newNode:Vector2):
	list.push_back(newNode)

func getLastNode():
	return list.back()

func getList():
	return list;

func duplicate():
	var newPath = get_script().new()
	newPath.list = list.duplicate()
	newPath.weight = weight;
	return newPath

func addPath(extraPath):
	list += extraPath

func _ready():
	pass
