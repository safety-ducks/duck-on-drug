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

func start_game():
	get_node("/root/MainScene/CanvasLayer/HUD/Lives").text = "Lives: "+str(get_node("/root/MainScene/Player").lifes)
	get_node("/root/MainScene/CanvasLayer/UI").hide()

	get_parent().get_tree().paused = false

	pass # Replace with function body.



func _on_Button_pressed():
	get_node("/root/MainScene/CanvasLayer/UI/Texture/Anim").play("turn")
	get_node("/root/MainScene/CanvasLayer/UI/StartDelay").start()
	hide()
	pass # Replace with function body.


func _on_StartDelay_timeout():
	start_game()
	pass # Replace with function body.
