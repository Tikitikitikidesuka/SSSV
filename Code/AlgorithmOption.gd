extends OptionButton


var algorithms = []
var textSize = Vector2(0,0)

signal algorithmChanged(algorithm_name)

func _ready():
	connect("item_selected", self, "_on_item_selected")
	update()
	selectAlgorithm(0)

func _on_item_selected(index:int):
	selectAlgorithm(index)

func update():
	var dir = Directory.new()
	if dir.open("res://Code/SeachAlgorithms") == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				algorithms.append(file_name.get_basename())
			file_name = dir.get_next()
	else:
		print("ERROR: The application files are corrupted")
	
	for algorithm in algorithms:
		add_item(algorithm)

func selectAlgorithm(index:int):
	select(index)
	setText(algorithms[index].replace("_", " "))
	emit_signal("algorithmChanged", algorithms[index])

func setText(text:String):
	var font = $AlgorithmLabel.get_font("font")
	textSize = font.get_string_size(text)
	if textSize.x > OS.window_size.x:
		font.size = OS.window_size.x * font.size / textSize.x
	$AlgorithmLabel.text = text
