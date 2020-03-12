extends KinematicBody

var velocity = Vector3(0, 0, 0)
const SPEED = 12
const ANGULAR_SPEED = deg2rad(9)

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("up") and Input.is_action_pressed("down"):
		velocity.z = 0
	elif Input.is_action_pressed("up"):
		velocity.z = -SPEED
	elif Input.is_action_pressed("down"):
		velocity.z = SPEED
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
	move_and_slide(velocity)
