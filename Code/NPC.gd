extends Area2D

export (String, "Right", "Left") var want_bubble_direction

var want_gift

var held

func _ready():
	if want_bubble_direction == "Left":
		$"Want Bubble".scale.x = -1

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
		$"Held Item".texture = global.textures[held.type]
		$"Held Item".vframes = global.vframes[held.type]
		$"Held Item".hframes = global.hframes[held.type]
		$"Held Item".scale = global.scales[held.type]
	
	if want_gift == null or held != null:
		$"Want Bubble/Want Gift".texture = null
		$"Want Bubble".visible = false
	else:
		$"Want Bubble".visible = true
		$"Want Bubble/Want Gift".texture = global.textures[want_gift.type]
		$"Want Bubble/Want Gift".vframes = global.vframes[want_gift.type]
		$"Want Bubble/Want Gift".hframes = global.hframes[want_gift.type]