extends Area2D

#warning-ignore:unused_class_variable
export (NodePath) var receiver
export (Color) var color

func _ready():
	$Sprite.modulate = color
	if receiver != "":
		get_node(receiver).want_gift = self

func _on_Gift_body_entered(_body):
	if not visible: # This is done instead of disabling the collision shape so if the player drops the gift in the same location where the gift spawn the player won't pick up the gift again
		return
	
	if global.hud.item != null:
		drop_gift()
	
	visible = false
	global.hud.item = self

func drop_gift():
	global.hud.item.visible = true
	global.hud.item = null