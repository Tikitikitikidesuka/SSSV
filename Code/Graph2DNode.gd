extends Sprite


const CCOLOR = Color(1    ,0    ,0   )
const VCOLOR = Color(0    ,1    ,0.95)
const FCOLOR = Color(0    ,1    ,0.2 )

const PCOLOR = Color(0.95 ,0.95 ,0.95 )
const WCOLOR = Color(0.1  ,0.1  ,0.1  )
const SCOLOR = Color(1    ,0.53 ,0.25 )
const ECOLOR = Color(0.9  ,0.25 ,1    )
const TCOLOR = Color(0.25 ,1    ,0.65 )

enum Type {START, END, PATH, WALL}

var type : int = -1
var visited = false setget setVisited
var checking = false setget setChecking
var finalPath = false setget setFinalPath
var tempPath = false setget setTempPath


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
		Type.START:
			modulate = SCOLOR
		Type.END:
			modulate = ECOLOR

func setVisited(newVisited:bool):
	visited = newVisited
	updateColor()

func setChecking(newChecking:bool):
	checking = newChecking
	updateColor()

func setFinalPath(newFinalPath:bool):
	finalPath = newFinalPath
	updateColor()

func setTempPath(newTempPath:bool):
	tempPath = newTempPath
	updateColor()

func reset():
	visited = false
	checking = false
	finalPath = false
	tempPath = false
	updateColor()

func updateColor():
	if type == Type.START or type == Type.END:
		return
	if finalPath:
		modulate = FCOLOR
	elif checking:
		modulate = CCOLOR
	elif tempPath:
		modulate = TCOLOR
	elif visited:
		modulate = VCOLOR
	else:
		match type:
			Type.PATH:
				modulate = PCOLOR
			Type.WALL:
				modulate = WCOLOR
