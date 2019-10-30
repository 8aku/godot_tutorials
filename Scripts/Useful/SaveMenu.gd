extends Control

onready var spinbox = $SaveWindow/SaveNumber

onready var game_saver = $SaveLoadGame
	
func _on_SaveGame_button_down():
	game_saver.save(spinbox.value)
	$SaveWindow.hide()

func _on_Load_button_down():
	print("imagine loading...")
	#_game_saver.load(spinbox.value)


func _on_Save_button_down():
	$SaveWindow.popup()
