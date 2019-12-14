extends Area2D

#warning-ignore:unused_class_variable
export (NodePath) var receiver
export (Color) var color

func _ready():
	$Sprite.modulate = color

func _on_Gift_body_entered(_body):
	if global.hud.item != null:
		global.hud.item.visible = true
		global.hud.item.get_node("CollisionShape2D").set_deferred("disabled", false)
		global.hud.item = null
	
	visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	global.hud.item = self