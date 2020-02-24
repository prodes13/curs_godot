extends KinematicBody

var velocity = Vector3(0, 0, 0)
const SPEED = 12
const ANGULAR_SPEED = deg2rad(9)

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		velocity.x = 0
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(-ANGULAR_SPEED)
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(ANGULAR_SPEED)
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	#math approach form to float
	if Input.is_action_pressed("up") and Input.is_action_pressed("down"):
		velocity.z = 0
	elif Input.is_action_pressed("up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(-ANGULAR_SPEED)
	elif Input.is_action_pressed("down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(ANGULAR_SPEED)
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
		
	move_and_slide(velocity)

#		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)	

func _on_Enemy_body_entered(body):
	if body.name == "Steve":
		get_tree().change_scene("res://GameOver.tscn")

# last video 
#https://www.youtube.com/watch?v=rS-PcTTiGtA
