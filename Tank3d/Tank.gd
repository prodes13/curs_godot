extends KinematicBody

var velocity = Vector3(0, 0, 0)
const SPEED = 12
const ANGULAR_SPEED = deg2rad(9)

onready var point = global_position
onready var obj = get_node("../../Player")
#node.get_global_transform().get_translation()

func _ready():
	print(obj.name)
	pass

func _physics_process(delta):
	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		velocity.x = 0
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
#		rotate_z(-ANGULAR_SPEED)
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
#		rotate_z(ANGULAR_SPEED)
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	#math approach form to float
	if Input.is_action_pressed("up") and Input.is_action_pressed("down"):
		velocity.z = 0
	elif Input.is_action_pressed("up"):
		velocity.z = -SPEED
#		rotate_x(-ANGULAR_SPEED)
	elif Input.is_action_pressed("down"):
		velocity.z = SPEED
#		rotate_x(ANGULAR_SPEED)
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
		
	move_and_slide(velocity)

func rotateAround(obj, point, axis, angle):
	var rot = angle + obj.rotation.y 
	var tStart = point
	obj.global_translate (-tStart)
	obj.transform = obj.transform.rotated(axis, -rot)
	obj.global_translate (tStart)


#Well for anyone else trying to do this here is what I came up with.
#
#obj is the Spatial object you want to rotate.
#point is a vector3, the point in world space you want to rotate around.
#axis is the axis you want to rotate around, ie y axis would be Vector3(0, 1, 0)
#angle is the angle (in radians) you want to set the objects rotation to, not the amount to rotate it by.
#
#func rotateAround(obj, point, axis, angle):
#    var rot = angle + obj.rotation.y 
#    var tStart = point
#    obj.global_translate (-tStart)
#    obj.transform = obj.transform.rotated(axis, -rot)
#    obj.global_translate (tStart)
#
#Note that if you want to rotate around a different axis other than Y you will also have to change obj.rotation.y to a different axis, this could be modified to support any axis but this is all I need for now.
