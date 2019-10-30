extends KinematicBody2D

export var speed_value = 1
export var lifes = 3
export var G = 10
export var jump_force = -300

export var pick_up_time = 5.0
export var shock_time = 5.0

var current_animation = "default"

var gravity_reverse = false
var trip_level = 200
var speed = Vector2()
var direction=1


func update_trip_level(value):
	trip_level += value
	get_node("/root/MainScene/CanvasLayer/HUD/TripLevel").text = "Trip level: " + str(trip_level)

func stopTripCounter():
	$TripTimer.stop()

func revert_gravity():
	jump_force *= -1
	G *= -1
	gravity_reverse = not gravity_reverse
	$Sprite.set_flip_v(gravity_reverse)
	$GravityTimer.wait_time = pick_up_time
	$GravityTimer.start()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	speed.x=0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# $Camera2D.make_current()
	
	pass
	
func _physics_process(delta):	
	var value = speed_value
	#if Input.is_key_pressed(KEY_CONTROL):
	#	if not gravity_reverse:
	#		revert_gravity()
	#	pass
		
	if Input.is_key_pressed(KEY_RIGHT):
		speed.x = value*direction
		get_node("Sprite").set_flip_h(direction==-1)
	elif Input.is_key_pressed(KEY_LEFT):
		speed.x = -value*direction
		get_node("Sprite").set_flip_h(direction==1)
	else:
		speed.x = 0

	
	
	if  is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		var random = randi()%4+1
		print_debug(random)
		if random == 3:
			$sound1.play()
		elif random == 2:
			$sound2.play()
		elif random == 1:
			$sound3.play()
		elif random == 4:
			$sound4.play()	
		
		speed.y = jump_force
	else:
		if is_on_ceiling():
			speed.y=0		
		if not is_on_floor():
			speed.y += G
		else: 
			speed.y = 0
			
	if abs(speed.x) > 1 and abs(speed.y) <= G:
		current_animation = "walk"
	elif speed.y<0:
		current_animation = "jump"
	elif speed.y>0:
		current_animation = "fall"
	else:
		current_animation = "default"
		print(speed.y)	
			
	if $Sprite.animation != current_animation:
		$Sprite.play(current_animation)
		
	move_and_slide(speed*delta*100,Vector2(0, (1 if gravity_reverse else -1) ))
	# print(move_and_collide(speed*delta))
	
func get_damage():
	lifes -= 1
	direction = -1
	get_node("/root/MainScene/CanvasLayer/HUD/Lives").text = "Lives: " + str(lifes)
	$ShockTimer.wait_time = shock_time
	$Particles2D.emitting = true
	$ShockTimer.start()

func _on_Area2D_body_entered(body):
	print (body)
	pass # Replace with function body.
	



func _on_GravityTimer_timeout():
	revert_gravity()
	$GravityTimer.stop()
	pass # Replace with function body.


func _on_TripTimer_timeout():
	update_trip_level(-10)
	pass # Replace with function body.


func _on_ShockTimer_timeout():
	direction = 1
	$Particles2D.emitting = false
	$ShockTimer.stop()
	pass # Replace with function body.
