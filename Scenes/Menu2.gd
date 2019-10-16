extends PopupPanel

func _draw():
	$Button.grab_focus()


func _on_SaveButton_pressed():
	$PopupPanel.hide()


func _on_Button_button_down():
	$FileDialog.show()
	#PopupPanel/TextEdit.text = ""
	#$PopupPanel.popup()

func _on_TextEdit_gui_input(ev):
	if ev is InputEventKey:
		if ev.scancode == KEY_TAB:
			$PopupPanel/TextEdit.text = $PopupPanel/TextEdit.text.replace("	", "").replace(" ", "")
			$PopupPanel/SaveButton.grab_focus()

func _on_FileDialog_hide():
	print("ok")
	$Button.grab_focus()


func _on_Button2_pressed():
	$FileDialog.hide()
	print("Loading!")
