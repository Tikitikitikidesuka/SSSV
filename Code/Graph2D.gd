extends Node2D


const G2DNode = preload("res://Scenes/Graph2DNode.tscn")
const TILE_SIZE = 32
const SCALE = 4

var size : Vector2
var matrix : Array
var start : Vector2
var end : Vector2


func _ready():
	pass

func init(newSize:Vector2, data:Array):
	size = newSize
	for y in newSize.y:
		var row = []
		for x in newSize.x:
			var newNode = G2DNode.instance()
			var type = data[y*newSize.y +x]
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

func getNeighbours(pos:Vector2, only_visited:bool):
	var neighbours = []
	for y in range(-1,2): # -1, 0, 1
		if y >= 0 and y < size.y:
			for x in range(-1,2): # -1, 0, 1
				if x >= 0 and x < size.x:
					if not only_visited or not matrix[y][x].visited:
						neighbours.push_back(Vector2(x,y))
	return neighbours

func getUnvisitedNeighbours(pos:Vector2):
	return getNeighbours(pos, true)

func getAllNeighbours(pos:Vector2):
	return getNeighbours(pos, false)
