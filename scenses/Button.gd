extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():

	pass # Replace with function body.


func _on_Button_pressed():
	var node = get_node("/root/MainScene/CanvasLayer/UI")
	node.hide()
	get_parent().get_tree().paused = false
	pass # Replace with function body.
