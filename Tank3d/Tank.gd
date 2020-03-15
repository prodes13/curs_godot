extends KinematicBody

export var speed = 10
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 30
export var mouse_sensivity = 0.3

var STEER_ANGLE = 0.02

onready var head = $Turret
onready var camera = $Turret/Camera
onready var body = $Body
onready var bullet_point = $Turret/Direction

export var bullet_speed = 900
export var fire_rate = 1

var bullet = preload("res://bullet/Bullet.tscn")
var can_fire = true

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

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.transform.origin = bullet_point.global_transform.origin
		bullet_instance.rotation_degrees = head.rotation_degrees
#		bullet_instance.apply_impulse(Vector3(), Vector3(0, 0, bullet_speed).rotated(rotation_degrees, 0))
		var dest_vector = bullet_point.get_global_transform().origin - get_global_transform().origin
		bullet_instance.apply_impulse(Vector3(), dest_vector*delta*bullet_speed)
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true

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

