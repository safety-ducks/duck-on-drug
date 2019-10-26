extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LSD_body_entered(body):
	if body.get_name() == "Player" and visible:
		$Sound.play()
		body.update_trip_level(100)
		hide()
		


func _on_Sound_finished():
	queue_free()
