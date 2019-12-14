extends Area2D

var held

func _physics_process(_delta):
	if global.hud.item != null and global.hud.item.receiver == "": # If the gift has no receiver the path will just be "" which will return the NPC node by default
		return
	
	if Input.is_action_just_pressed("give_gift") and (global.player.position - position).length() <= 90:
		if global.hud.item == null:
			if held == null:
				return
			
			# Take back gift
			global.hud.item = held
			held = null
		else:
			if get_node(global.hud.item.receiver) == self:
				held = global.hud.item
				global.hud.item = null

func _process(_delta):
	if held == null:
		$"Held Item".texture = null
	else:
		$"Held Item".texture = held.get_node("Sprite").texture
		$"Held Item".modulate = held.color