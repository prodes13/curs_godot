extends CanvasLayer

func _ready():
	add_to_group("GUI")
	$Control/TextureRect/HBoxContainer/LifeCount.text = "3"

func update_gui(lives, coins):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
