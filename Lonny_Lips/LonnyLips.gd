extends Control 

var player_words = []
var story = "Once upon a time %s watched %s and thought it was the %s movie off all time!"
var prompts = ["Individus", "Minions", "greatest"]

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

#func _ready():
#	print(story % prompts)
#	DisplayText.text = story % prompts


func update_DisplayText(words):
	DisplayText.text = words
	PlayerText.clear()

func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)

func _on_TextureButton_pressed():
	var words = PlayerText.text
	update_DisplayText(words)

func add_to_player_words():
	pass