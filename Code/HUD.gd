extends CanvasLayer

var item = null

func _ready():
	global.hud = self

func _process(_delta):
	if item == null:
		$"Item/Item Image".texture = null
	else:
		$"Item/Item Image".texture = global.textures[item.type]
		$"Item/Item Image".vframes = global.vframes[item.type]
		$"Item/Item Image".hframes = global.hframes[item.type]
		$"Item/Item Image".scale = global.scales[item.type]

func _on_Item_Image_texture_changed():
	$"Item/Item Image".frame = 0
	if item != null and item.type == "Key":
		$AnimationPlayer.play("Key")