extends Area2D

#warning-ignore:unused_class_variable
export (NodePath) var receiver
export (String, "Present", "Key") var type

var original_owner

func _ready():
	var vframe = global.vframes[type]
	var hframe = global.hframes[type]
	$Sprite.texture = global.textures[type]
	$Sprite.vframes = vframe
	$Sprite.hframes = hframe
		
	var rect = RectangleShape2D.new()
	var sprite_size = $Sprite.texture.get_size()
	sprite_size.y /= vframe
	sprite_size.x /= hframe
	sprite_size /= 2
	rect.extents = sprite_size
	$CollisionShape2D.shape = rect
	
	if receiver != "":
		get_node(receiver).want_gift = self

func _on_Gift_body_entered(_body):
	if not visible: # This is done instead of disabling the collision shape so if the player drops the gift in the same location where the gift spawn the player won't pick up the gift again
		return
	
	if global.hud.item != null:
		global.hud.item.drop_gift()
	
	visible = false
	global.hud.item = self

func drop_gift():
	if original_owner:
		var offset = Vector2(50, 10)
		if original_owner.want_bubble_direction == "Left":
			offset.x *= -1
		position = original_owner.position + offset
	
	global.hud.item.visible = true
	global.hud.item = null