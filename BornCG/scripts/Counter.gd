extends Label

var coins = 0

func _ready():
	text = String(coins)

func _on_Coin_coinCollected():
	coins = coins + 1
	_ready()
	if coins == 10:
		$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://GameWon.tscn")
