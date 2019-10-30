extends "res://Scripts/Interactable.gd"

const keyItem = preload("res://Scripts/KeyItem.gd")
var hasKey = true 

func action(inventory):
	if !hasKey:
		inventory.append(keyItem)

func update_choices(choices):
	choices["haveKey2"] = true
	hasKey = false