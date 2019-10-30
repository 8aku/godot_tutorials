extends PopupPanel

func _draw():
	$Button.grab_focus()


func _on_SaveButton_pressed():
	$PopupPanel.hide()


func _on_Button_button_down():
	$PopupPanel/TextEdit.text = ""
	$PopupPanel.popup()
	#$FileDialog.show()

func _on_TextEdit_gui_input(ev):
	if ev is InputEventKey:
		if ev.scancode == KEY_TAB:
			$PopupPanel/TextEdit.text = $PopupPanel/TextEdit.text.replace("	", "").replace(" ", "")
			$PopupPanel/SaveButton.grab_focus()

func _on_FileDialog_hide():
	$Button.grab_focus()


func _on_Button2_pressed():
	$FileDialog.hide()
	print("Loading!")


func _on_Button3_pressed():
	 get_tree().quit()
