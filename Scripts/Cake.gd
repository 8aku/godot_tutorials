extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and Input.is_action_pressed("inspect_item"):
			print("go to bed")
			$CanvasLayer/DialoguePanel/Panel.popup()