extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var enemy_speed = 1
export var time_min = 3
export var time_max = 5
var Velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	Velocity.x = enemy_speed
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if not $RayCast2D.is_colliding() or not $RayCast2D2.is_colliding() or $RayCast2D3.is_colliding() or $RayCast2D4.is_colliding():
		Velocity.x *= -1
		pass
	
	position.x += Velocity.x*delta
	
	if $RayCast2D3.is_colliding():
		print(3)
		
func _on_Timer_timeout():
	Velocity.x *= -1
	#$Timer.stop()
	$Timer.wait_time = rand_range(2,5)
	pass # Replace with function body.
