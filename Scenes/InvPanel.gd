extends Panel

var item_held = null
var item_offset = Vector2()
var last_container = null
var last_pos = Vector2()
#onready var otherContainer =

func _process(delta):
	if (self.is_visible_in_tree()):
	    var cursor_pos = get_global_mouse_position()
	    if Input.is_action_just_released("click"):
	        grab(cursor_pos)
#    if Input.is_mouse_button_pressed(BUTTON_LEFT):
#        release(cursor_pos)
#    if item_held != null:
#        item_held.rect_global_position = cursor_pos + item_offset
 
func grab(cursor_pos):
	var c = get_container_under_cursor(cursor_pos)
	print(c)
	if c != null and c.has_method("grab_item"):
	    item_held = c.grab_item(cursor_pos)
	    if item_held != null:
	        last_container = c
	        last_pos = item_held.rect_global_position
	        item_offset = item_held.rect_global_position - cursor_pos
	        move_child(item_held, get_child_count())

func get_container_under_cursor(cursor_pos):
	if get_global_rect().has_point(cursor_pos):
		return 
		return null