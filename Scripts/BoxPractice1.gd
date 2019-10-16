extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    $Panel.popup()

func _on_Button_pressed():
	print("button 1 pressed")
	$Button1Launch.popup()


func _on_Button2_pressed():
	print("button 2 pressd")