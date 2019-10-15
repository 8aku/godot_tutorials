extends KinematicBody2D
# Instead of _fixed_process use _physics_process. Instead of move() use move_and_collide(). Instead of set_rotd() use set_rotation_degrees().
export var MOTION_SPEED = 220
var RayNode

func _ready():
	set_physics_process(true)
	
	RayNode = $RayCast2D
	
func _physics_process(delta):
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
	
func save(save_game):
	save_game.data["PLAYER"] = {
		"position": position
	}
