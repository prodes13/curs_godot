extends KinematicBody

var velocity = Vector3(0, 0, 0)
const SPEED = 6

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		velocity.x = 0
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	#math approach form to float
	if Input.is_action_pressed("up") and Input.is_action_pressed("down"):
		velocity.z = 0
	elif Input.is_action_pressed("up"):
		velocity.z = -SPEED
	elif Input.is_action_pressed("down"):
		velocity.z = SPEED
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
		
	move_and_slide(velocity)
	
#continue from 
#https://www.youtube.com/watch?v=VWy4ErYd630&t=908s
