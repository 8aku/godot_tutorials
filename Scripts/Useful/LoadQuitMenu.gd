extends PopupPanel

func _draw():
	$Button.grab_focus()


func _on_SaveButton_pressed():
	$SaveMenu.hide()


func _on_Button_button_down():
	$SaveMenu/TextEdit.text = ""
	$SaveMenu.popup()
	#$FileDialog.show()

func _on_TextEdit_gui_input(ev):
	if ev is InputEventKey:
		if ev.scancode == KEY_TAB:
			$SaveMenu/TextEdit.text = $PopupPanel/TextEdit.text.replace("	", "").replace(" ", "")
			$SaveMenu/SaveButton.grab_focus()

func _on_FileDialog_hide():
	$Button.grab_focus()


func _on_Button2_pressed():
	$FileDialog.hide()
	print("Loading!")


func _on_Button3_pressed():
	 get_tree().quit()