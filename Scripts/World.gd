extends Node

onready var menu_popup = get_node("MenuCanvas/Panel")
onready var save_popup = get_node("MenuCanvas/Panel/PopupPanel")
var toggle = false
	
func _input(event):
	if event.is_action_pressed("pause_game"):
		toggle = !toggle
	if (toggle):
		get_tree().paused = true
		menu_popup.show()
		
	elif (!toggle):
		menu_popup.hide()
		save_popup.hide()
		get_tree().paused = false