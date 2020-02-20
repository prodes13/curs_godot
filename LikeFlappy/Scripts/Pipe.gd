extends Spatial

func _ready():
#	making them having diferent y - random
	translate(Vector3(0, float(rand_range(-3, 3)), 0))

func _process(delta):
#	moving towards the player
	translate(Vector3(0, 0, 4 * delta))

func _on_Pipe_body_entered(body):
	if body.name == "Bird":
		get_tree().reload_current_scene()
