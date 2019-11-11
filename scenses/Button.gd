extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/MainScene").game_started = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_game():
	if get_node("/root/MainScene").game_started:
		return
	get_node("/root/MainScene/CanvasLayer/HUD/Lives").text = "Lives: "+str(get_node("/root/MainScene/Player").lifes)
	get_node("/root/MainScene/CanvasLayer/UI").hide()
	get_node("/root/MainScene/CanvasLayer/UI/Texture/Node2D/Anim").hide()
	get_node("/root/MainScene/CanvasLayer/UI/Texture/Label").hide()
	get_node("/root/MainScene/CanvasLayer/UI/Restart").show()
	get_parent().get_tree().paused = false
	get_node("/root/MainScene").game_started = true
	

	pass # Replace with function body.



func _on_Button_pressed():
	get_node("/root/MainScene/CanvasLayer/UI/Texture/Node2D/Anim").play("turn")
	get_node("/root/MainScene/CanvasLayer/UI/StartDelay").start()
	get_node("/root/MainScene/CanvasLayer/UI/Texture/AnimationPlayer").play('Sink')
	hide()
	pass # Replace with function body.


func _on_StartDelay_timeout():
	start_game()
	pass # Replace with function body.
