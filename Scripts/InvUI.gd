extends Control

var inventory = []

func append(item):
	inventory.append(item)
	print(inventory.size())
	
func find(item):
	return inventory.find(item)
	
	
		
#func add_to_inv_ui(target):
#	var invImage = TextureRect.new()
#	invImage.texture = target.texture;
#	for i in range(0, inventory.size()):
#		invImage.set_position(Vector2(10, 10 + 75*i))
#		invImage.set_size(Vector2(580, 50))
#
#	$CanvasLayer/InvUI/Panel.add_child(invImage);