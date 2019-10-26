extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_tree().paused = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

func _input(ev):
	if Input.is_key_pressed(KEY_ENTER) or Input.is_key_pressed(KEY_ESCAPE):
		visible = not visible
		get_parent().get_tree().paused = visible
		