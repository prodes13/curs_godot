extends Area2D



func _on_SpikeTop_body_entered(body):
	get_tree().call_group("Gamestate", "hurt")
#	if body.has_method("hurt"):
#		body.hurt()
