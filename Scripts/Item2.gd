extends Node2D

export (Texture) var texture

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func action(inventory):
	print("action!")

func update_choices(choices):
	choices["haveItem2"] = true