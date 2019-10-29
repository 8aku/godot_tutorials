extends Node2D

export (Texture) var texture

func _ready():
	pass

func update_choices(choices):
	choices["haveInvitation"] = true
	
func action(inventory):
	print("action!")