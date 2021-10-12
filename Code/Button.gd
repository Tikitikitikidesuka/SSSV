extends Area2D

var is_pressed = false

func _ready():
	pass

signal pressed
signal released

# To detect release even after mouse leaves button area
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			fake_release()

# To detect click only when mouse is inside button area
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				press()
			if not event.pressed:
				release()

func press():
	is_pressed = true
	$Sprite.modulate = Color(0.6, 0.6, 0.6)
	emit_signal("pressed")

func release():
	is_pressed = false
	$Sprite.modulate = Color(1, 1, 1)
	emit_signal("released")

func fake_release():
	is_pressed = false
	$Sprite.modulate = Color(1, 1, 1)
