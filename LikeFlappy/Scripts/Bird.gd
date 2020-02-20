extends RigidBody

var temp = Vector3(0, 0, 0)

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_pressed("flap"):
#		jumps
		temp = linear_velocity
		temp.y = 300 * delta
		linear_velocity = temp
		
	
