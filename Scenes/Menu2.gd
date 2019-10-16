extends PopupPanel

func _draw():
	$Button.grab_focus()


func _on_SaveButton_pressed():
	$PopupPanel.hide()


func _on_Button_button_down():
	$PopupPanel.popup()