extends KinematicBody2D
# Instead of _fixed_process use _physics_process. Instead of move() use move_and_collide(). Instead of set_rotd() use set_rotation_degrees().
export var MOTION_SPEED = 220
var RayNode
# this will be false in a dialogue event
var canMove = true
var canInteract = false 
var target
var inventory = []

func _ready():
	set_physics_process(true)
	
	RayNode = $RayCast2D
	
func _physics_process(delta):
	if (canMove):
		move_player(delta)
		

func move_player(delta):
	var motion = Vector2()
	
	#motion
	if (Input.is_action_pressed("ui_up")):
		motion += Vector2(0, -1)
		RayNode.set_rotation_degrees(180)
	if (Input.is_action_pressed("ui_down")):
		motion += Vector2(0, 1) 
		RayNode.set_rotation_degrees(0)
	if (Input.is_action_pressed("ui_left")):
		motion += Vector2(-1, 0)
		RayNode.set_rotation_degrees(-90)
	if (Input.is_action_pressed("ui_right")):
		motion += Vector2(1, 0) 
		RayNode.set_rotation_degrees(90)
		
	if motion.x != 0:
		$AnimatedSprite.animation = "idle"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = motion.x < 0
	#elif motion.y != 0:
		#$AnimatedSprite.animation = "idle"
		#$AnimatedSprite.flip_v = motion.y > 0

	motion = motion.normalized() * MOTION_SPEED * delta
	move_and_collide(motion)
	
func _input(event):
	if(canInteract and event.is_action_pressed("interact")):
		print("Interacting with " + target.get_name())
		get_node("../../DialogueParser").init_dialogue(target.get_name())
		canMove = false
		# if NPC gives you item, it will append to inv here
		target.action(inventory)
		
		if(target.is_in_group("Item") and inventory.find(target) < 0):
			inventory.append(target)
			add_to_inv_ui(target)
			
			#deletes item!
			#target.queue_free()

func _on_Area2D_body_enter(body, obj):
	if(body.get_name() == "Player"):
		canInteract = true
		target = obj
	
func _on_Area2D_body_exit(body, obj):
	if(body.get_name() == "Player"):
		canInteract = false
		target = null

func save(save_game):
	save_game.data["PLAYER"] = {
		"position": position
	}
	
func add_to_inv_ui(target):
	var invImage = Texture.new()
	invImage.texture = target.texture;
	for i in range(0, inventory.size()):
		invImage.set_position(Vector2(10, 10 + 75*i))
		invImage.set_size(Vector2(580, 50))
		
	$CanvasLayer/InvUI/Panel.add_child(invImage);
	
func show_inventory():
		$CanvasLayer/InvUI/Panel.show()
	
func hide_inventory():
	$CanvasLayer/InvUI/Panel.hide()
