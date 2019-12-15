extends Area2D

export (String, "Right", "Left") var want_bubble_direction
export (String, "Key", "Other") var give_gift

var want_gift

var held

var gift_scene = load("res://Scenes/Gift.tscn")

func _ready():
	if want_bubble_direction == "Left":
		$"Want Bubble".scale.x = -1
	
	var gift_instance = gift_scene.instance()
	gift_instance.position = Vector2(-100, 0) # So the player cannot see it on screen
	gift_instance.type = "Key"
	gift_instance.original_owner = self
	
	held = gift_instance
	get_parent().get_parent().get_node("Gifts").add_child(gift_instance)

func _physics_process(_delta):
	if Input.is_action_just_pressed("give_gift") and (global.player.position - position).length() <= 90:
		if global.hud.item == null: # If player is holding nothing
			return
		
		if get_node(global.hud.item.receiver) == self:
			# Swap gifts
			var old_held = held
			held = global.hud.item
			global.hud.item = old_held

func _process(_delta):
	if held == null:
		$"Held Item".texture = null
	else:
		$"Held Item".texture = global.textures[held.type]
		$"Held Item".vframes = global.vframes[held.type]
		$"Held Item".hframes = global.hframes[held.type]
		$"Held Item".scale = global.scales[held.type]
	
	if want_gift == null or held == want_gift:
		$"Want Bubble/Want Gift".texture = null
		$"Want Bubble".visible = false
	else:
		$"Want Bubble".visible = true
		$"Want Bubble/Want Gift".texture = global.textures[want_gift.type]
		$"Want Bubble/Want Gift".vframes = global.vframes[want_gift.type]
		$"Want Bubble/Want Gift".hframes = global.hframes[want_gift.type]