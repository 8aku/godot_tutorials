extends Node

onready var menu_popup = get_node("MenuCanvas/Panel")
onready var save_popup = get_node("MenuCanvas/Panel/PopupPanel")
var toggle = false

func _ready():
	var player = get_node("TileMap/Player")
	var interactables = get_tree().get_nodes_in_group("Interactable")
	for i in range(interactables.size()):
		var currNode = get_node(interactables[i].get_path())
		var area2DNode = currNode.get_node("Area2D")
		var args = Array([currNode])
		area2DNode.connect("body_entered", player, "_on_Area2D_body_enter", args)
		area2DNode.connect("body_exited", player, "_on_Area2D_body_exit", args)

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