extends Control

onready var spinbox = $SaveWindow/SaveNumber

onready var game_saver = $SaveLoadGame

func _on_Save_pressed():
	spinbox.value = 0
	$SaveWindow.show_modal()
	
func _on_Load_pressed():
	print("imagine loading...")
	#_game_saver.load(spinbox.value)

func _on_SaveGame_pressed():
	game_saver.save(spinbox.value)
	$SaveWindow.hide()
