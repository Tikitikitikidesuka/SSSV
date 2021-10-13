extends Node


const SEARCH_ALGORITHMS_DIR = "res://Code/SeachAlgorithms/"

var Graph2D = preload("res://Scenes/Graph2D.tscn")
var Graph2DSearch = preload("res://Code/Graph2DSearch.gd")

var algorithm = "Branch_And_Bound"

var playing = false

var menuHeight = 100
var tileSize = 64
var gridTiles = Vector2(8,9)
var data = [
	3, 3, 3, 3, 3, 3, 3, 3,
	0, 2, 2, 2, 3, 2, 3, 3,
	3, 2, 3, 2, 2, 2, 2, 3,
	3, 2, 3, 3, 3, 3, 2, 3,
	3, 2, 2, 3, 2, 2, 2, 3,
	3, 3, 2, 2, 2, 3, 2, 3,
	3, 3, 2, 3, 2, 2, 3, 3,
	3, 3, 2, 2, 3, 2, 2, 1,
	3, 3, 3, 3, 3, 3, 3, 3
	]

var graph2D
var searcher

func _ready():
	graph2D = Graph2D.instance()
	graph2D.setTileSize(tileSize)
	graph2D.init(gridTiles, data)
	
	var windowSize = gridTiles * tileSize
	
	var algorithmDisplayName = algorithm.replace("_", " ")
	var font = $AlgorithmLabel.get_font("font")
	var textSize = font.get_string_size(algorithmDisplayName)
	if textSize.x > windowSize.x:
		font.size = windowSize.x * font.size / textSize.x
	$AlgorithmLabel.text = algorithmDisplayName
	windowSize.y += textSize.y
	
	$Menu.set_position(Vector2(0, windowSize.y))
	$Menu.fit_height(menuHeight)
	$Menu.margin_top = 10
	$Menu.margin_bottom = 10
	$Menu.center_vertically(windowSize.x)
	windowSize.y += menuHeight
	
	$Menu.connect("reset", self, "_on_Menu_reset")
	$Menu.connect("pause", self, "_on_Menu_pause")
	$Menu.connect("play", self, "_on_Menu_play")
	$Menu.connect("next", self, "_on_Menu_next")
	
	graph2D.position.y += textSize.y
	OS.window_resizable = false
	OS.window_size = windowSize
	
	add_child(graph2D)
	searcher = Graph2DSearch.new(graph2D)
	searcher.initAlgorithm(load(SEARCH_ALGORITHMS_DIR + algorithm + ".gd"))

var timeCntr = 0.0
var timeInterval = 0.1

func _process(delta):
	if playing:
		timeCntr += delta
		if timeCntr > timeInterval:
			searcher.nextStep()
			timeCntr = 0.0

func _on_Menu_reset():
	print("reset")
	graph2D.reset()
	searcher.reset()
	playing = false

func _on_Menu_pause():
	print("pause")
	playing = false

func _on_Menu_play():
	print("play")
	playing = true

func _on_Menu_next():
	if not playing:
		searcher.nextStep()
