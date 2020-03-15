extends KinematicBody

export var speed = 10
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 30
export var mouse_sensivity = 0.3

var STEER_ANGLE = 0.02

onready var head = $Turret
onready var camera = $Camera
onready var body = $Body

var velocity = Vector3()
var camera_x_rotation = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(deg2rad(-event.relative.x * mouse_sensivity))
		
		var x_delta = event.relative.y * mouse_sensivity
#		if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90:
#			camera.rotate_x(deg2rad(-x_delta))
#			camera_x_rotation += x_delta

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta):
	var body_basis = body.get_global_transform().basis
	
	var direction = Vector3()
	if Input.is_action_pressed("up"):
		direction -= body_basis.z
	elif Input.is_action_pressed("down"):
		direction += body_basis.z
	if Input.is_action_pressed("left"):
#		direction -= body_basis.x
		body.rotate_y(STEER_ANGLE)
	elif Input.is_action_pressed("right"):
#		direction += body_basis.x
		body.rotate_y(-STEER_ANGLE)
	direction = direction.normalized()
	
#	create fps walking
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity.y -= gravity
	
#	if Input.is_action_just_pressed("jump") and is_on_floor():
#		velocity.y += jump_power
		
	velocity = move_and_slide(velocity, Vector3.UP)

