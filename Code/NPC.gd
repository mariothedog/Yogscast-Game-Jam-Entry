extends Area2D

var held

func _physics_process(_delta):
	if global.hud.item == null or global.hud.item.receiver == "": # If the gift has no receiver the path will just be "" which will return the NPC node by default
		return
	
	if Input.is_action_just_pressed("give_gift") and get_node(global.hud.item.receiver) == self and (global.player.position - position).length() <= 90:
		held = global.hud.item
		$"Held Item".texture = held.get_node("Sprite").texture
		$"Held Item".modulate = held.color
		global.hud.item = null
		
		#$"Held Item".texture = global.hud.item.get_node("Sprite").texture
		#$"Held Item".modulate = global.hud.item.color
		#global.hud.item = null