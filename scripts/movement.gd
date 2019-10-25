extends KinematicBody2D

export var speed_value = 1

var speed = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	speed.x=0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.make_current()
	pass
	
func _physics_process(delta):	
	var value = speed_value
	if Input.is_key_pressed(KEY_SHIFT):
		value = speed_value * 0.5
		
	if Input.is_key_pressed(KEY_RIGHT):
		speed.x = value
	elif Input.is_key_pressed(KEY_LEFT):
		speed.x = -value
	else:
		speed.x = 0
	
	if  is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		speed.y = -300
	else:
		if is_on_ceiling():
			speed.y=0		
		if not is_on_floor():
			speed.y += 10
		else: 
			speed.y = 0
		
	move_and_slide(speed*delta*100,Vector2(0,-1))

func _on_Area2D_body_entered(body):
	print (body)
	pass # Replace with function body.