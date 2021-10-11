extends Node2D


const G2DNode = preload("res://Scenes/Graph2DNode.tscn")
const TILE_SIZE = 32
const SCALE = 2

var size : Vector2
var matrix : Array
var start : Vector2
var end : Vector2

var checking = false
var checkingNode : Vector2

var shownPath : Array = []


func _ready():
	pass

func init(newSize:Vector2, data:Array):
	size = newSize
	for y in newSize.y:
		var row = []
		for x in newSize.x:
			var newNode = G2DNode.instance()
			var type = data[y*newSize.x +x]
			var pos = Vector2(x, y)
			match type:
				newNode.Type.START:
					start = pos
				newNode.Type.END:
					end = pos
			newNode.init(type)
			newNode.position = pos * TILE_SIZE * SCALE
			newNode.scale = Vector2(SCALE, SCALE)
			add_child(newNode)
			row.push_back(newNode)
		matrix.push_back(row)

func getNode(pos:Vector2):
	return matrix[pos.y][pos.x]

func checkNode(pos:Vector2):
	if not checking:
		getNode(pos).checking = true
		checkingNode = pos
		checking = true
	elif pos != checkingNode:
		getNode(checkingNode).checking = false
		getNode(pos).checking = true
		checkingNode = pos
		checking = true

func uncheckNode():
	getNode(checkingNode).checking = false
	checking = false

func getNeighboursDiag(pos:Vector2, only_visited:bool):
	var neighbours = []
	for y in range(pos.y-1,pos.y+2): # y_pos - 1 to y_pos +1
		if y >= 0 and y < size.y:
			for x in range(pos.x-1,pos.x+2): # x_pos - 1 to x_pos +1
				if x >= 0 and x < size.x:
					if not only_visited or not matrix[y][x].visited:
						if matrix[y][x].type != matrix[y][x].Type.WALL:
							neighbours.push_back(Vector2(x,y))
	return neighbours

func getNeighbours(pos:Vector2, only_visited:bool):
	var neighbours = []
	for disp in [Vector2(0,1),Vector2(1,0),Vector2(0,-1),Vector2(-1,0)]:
		var y = disp.y + pos.y
		var x = disp.x + pos.x
		if y >= 0 and y < size.y and x >= 0 and x < size.x:
			if not only_visited or not matrix[y][x].visited:
				if matrix[y][x].type != matrix[y][x].Type.WALL:
					neighbours.push_back(Vector2(x,y))
	return neighbours

func getUnvisitedNeighbours(pos:Vector2):
	return getNeighbours(pos, true)

func getAllNeighbours(pos:Vector2):
	return getNeighbours(pos, false)

func showPath(path, final = false):
	for node in shownPath:
		getNode(node).tempPath = false
	shownPath = path
	if not final:
		for node in path:
			getNode(node).tempPath = true
	else:
		for node in path:
			getNode(node).finalPath = true

func hidePath():
	for node in shownPath:
		getNode(node).tempPath = false
	shownPath = []
