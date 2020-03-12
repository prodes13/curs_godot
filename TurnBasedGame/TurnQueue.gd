extends Node2D

class_name TurnQueue

var active_character

func initialize():
	active_character = get_child(0)
	print(active_character.name)

func play_turn():
	yield(active_character.play_turn(), "completed")
	var new_index : int = (active_character.get_index() + 1) % get_child_count()
#	 when it gets to the last .. it returns back to zero
	active_character = get_child(new_index)

