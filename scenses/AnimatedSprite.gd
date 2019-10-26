extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	randomize()
	var result = rand_range(0.0,1.0)
	if result >= 0.5:
		play("Win")
	else:
		play("Lose")
	print (str(result))
	pass # Replace with function body.
