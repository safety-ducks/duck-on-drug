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


func _on_Shroom_body_entered(body):
	if body.get_name() == "Player" and visible:
		body.revert_gravity()
		$ShroomSound.play()
		hide()
		
		
	#print("lifes left: ", body.lifes)
	pass # Replace with function body.


func _on_ShroomSound_finished():
	queue_free()
