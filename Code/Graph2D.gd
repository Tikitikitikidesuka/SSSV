extends Node2D


const G2DNode = preload("res://Scenes/Graph2DNode.tscn")
const TILE_SIZE = 32
const SCALE = 4

var size : Vector2
var matrix : Array


func _ready():
	pass

func init(newSize:Vector2, data:Array):
	size = newSize
	for y in newSize.y:
		var row = []
		for x in newSize.x:
			var newNode = G2DNode.instance()
			newNode.init(data[y*newSize.y +x])
			newNode.position = Vector2(x, y) * TILE_SIZE * SCALE
			newNode.scale = Vector2(SCALE, SCALE)
			add_child(newNode)
			row.push_back(newNode)
		matrix.push_back(row)

