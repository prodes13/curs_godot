extends Spatial

onready var timer = $Timer

func _ready():
	pass


func _on_Timer_timeout():
	timer.start()
	var newPipe = load("res://Scenes/Pipes.tscn").instance()
	newPipe.translate(Vector3(0, 0, -35))
	add_child(newPipe)
