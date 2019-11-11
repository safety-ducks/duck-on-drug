extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var game_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
#	$Player/AudioStreamPlayer2D.
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	

func _on_Button_pressed():
	get_parent().get_tree().paused = false
	pass # Replace with function body.


func _on_Restart_button_down():
	get_tree().reload_current_scene()
	pass # Replace with function body.
