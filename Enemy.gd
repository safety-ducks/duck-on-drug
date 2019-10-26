extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var enemy_speed = 1
export var time_min = 3
export var time_max = 5
var Velocity = Vector2()

func flip():
	Velocity.x *= -1
	$AnimatedSprite.flip_h = Velocity.x < 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Velocity.x = enemy_speed
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if not $BottomFront.is_colliding() or not $BottomRear.is_colliding() or $Rear.is_colliding() or $Front.is_colliding(): 
		flip()
		pass
	
	position.x += Velocity.x*delta

		
func _on_Timer_timeout():
	flip()
	#$Timer.stop()
	$Timer.wait_time = rand_range(2,5)
	pass # Replace with function body.
	


func _on_Enemy_body_entered(body):
	if body.get_name() == "Player":
		body.get_damage()
		$Timer.stop()
		queue_free()
	print("lifes left: ", body.lifes)
	pass # Replace with function body.
