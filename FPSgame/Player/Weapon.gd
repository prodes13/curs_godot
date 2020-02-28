extends Node

class_name Weapon

export var fire_rate = 0.5
export var clip_size = 5
export var reload_rate = 1

onready var ammo_label = $"/root/World/UI/Label"
onready var raycast = $"../Head/Camera/RayCast"
	
var current_ammo = 0
var can_fire = true
#we need to keep track of reloading, otherwise we will have some awkward bugs
var reloading = false

func _ready():
	current_ammo = clip_size

func _process(_delta):
	if reloading:
		ammo_label.set_text("Reloading...")
	else:
		ammo_label.set_text("Ammo\n %d / %d" % [current_ammo, clip_size])
	if Input.is_action_just_pressed("primary_fire") and can_fire:
		if current_ammo > 0 and not reloading:
			fire()
		elif not reloading:
			reload()
	if Input.is_action_just_pressed("reload") and not reloading:
		reload()

func check_collision():
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_in_group("Enemies"):
			print("Hit Enemy")
			collider.queue_free()
			print("Killed " + collider.name)

func fire():
	print("Fired weapon!")
	can_fire = false
	current_ammo -= 1
	check_collision()
	#time in seconds -> fire_rate
	#timeout -> the applied method
	yield(get_tree().create_timer(fire_rate), "timeout")
		
	can_fire = true

func reload():
	print("Reload!")
	reloading = true
	yield(get_tree().create_timer(reload_rate), "timeout")
	current_ammo = clip_size
	reloading = false


#   https://www.youtube.com/watch?v=5YT4bFw9k4U
