extends Sprite


const CCOLOR = Color(1   ,0   ,0   )
const VCOLOR = Color(0   ,1   ,0.95)

const PCOLOR = Color(0.95   ,0.95   ,0.95   )
const WCOLOR = Color(0.1 ,0.1 ,0.1 )

enum Type {START, END, PATH, WALL}

var type : int = -1
var visited = false setget setVisited
var checking = false setget setChecking


func _ready():
	if type == -1:
		init(Type.PATH)

func init(newType):
	type = newType
	match newType:
		Type.PATH:
			modulate = PCOLOR
		Type.WALL:
			modulate = WCOLOR

func setVisited(newVisited:bool):
	visited = newVisited
	if newVisited:
		modulate = VCOLOR

func setChecking(newChecking:bool):
	checking = newChecking
	if newChecking:
		modulate = CCOLOR
