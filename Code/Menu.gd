extends Node2D


const OG_HEIGHT = 128
const OG_WIDTH = 728

var real_position = position setget set_position
var real_height = OG_HEIGHT setget fit_height
var height = OG_HEIGHT setget fit_height
var width = OG_WIDTH
var margin_top = 0 setget set_top_margin
var margin_bottom = 0 setget set_bottom_margin
var margin_left = 0 setget set_left_margin
var margin_right = 0 setget set_right_margin

signal reset
signal pause
signal play
signal next

func _ready():
	$ResetButton.connect("released", self, "_on_Reset_pressed")
	$PauseButton.connect("released", self, "_on_Pause_pressed")
	$PlayButton.connect("released", self, "_on_Play_pressed")
	$NextButton.connect("released", self, "_on_Next_pressed")

func _on_Reset_pressed():
	emit_signal("reset")

func _on_Pause_pressed():
	emit_signal("pause")

func _on_Play_pressed():
	emit_signal("play")

func _on_Next_pressed():
	emit_signal("next")

func set_top_margin(newTopMargin:int):
	margin_top = newTopMargin
	update_position()
	update_height()

func set_bottom_margin(newBottomMargin:int):
	margin_bottom = newBottomMargin
	update_position()
	update_height()

func set_left_margin(newLeftMargin:int):
	margin_left = newLeftMargin
	update_position()
	update_height()

func set_right_margin(newRightMargin:int):
	margin_right = newRightMargin
	update_position()
	update_height()

func set_position(newPosition:Vector2):
	real_position = newPosition
	update_position()

func fit_height(newHeight:int):
	real_height = newHeight
	update_height()

func update_position():
	position = real_position + Vector2(margin_left, margin_top)

func update_height():
	height =  real_height - margin_top - margin_bottom
	var newScale = float(height) / OG_HEIGHT
	width = OG_WIDTH * newScale
	scale = Vector2(newScale, newScale)

func center_vertically(newWidth:int):
	print(newWidth)
	position.x = newWidth/2 - width/2
