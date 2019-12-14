extends CanvasLayer

var item = null

func _ready():
	global.hud = self

func _process(_delta):
	if item == null:
		$"Item/Item Image".texture = null
	else:
		$"Item/Item Image".texture = item.get_node("Sprite").texture
		$"Item/Item Image".modulate = item.color