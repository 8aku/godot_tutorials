extends "res://Scripts/Interactable.gd"

func consume():
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_action_released("click"):
		print("consumed")
		consume()