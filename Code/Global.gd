extends Node

#warning-ignore-all:unused_class_variable

var player
var hud

var textures = {
	"Present": load("res://Art/Gifts/Present.png"),
	"Key": load("res://Art/Gifts/Key.png")
}

var vframes = {
	"Present": 1,
	"Key": 5
}

var hframes = {
	"Present": 1,
	"Key": 3
}

var scales = {
	"Present": Vector2(1.1, 1.1),
	"Key": Vector2(1.5, 1.5)
}

var hud_scales = {
	"Present": Vector2(1.5, 1.5),
	"Key": Vector2(2, 2)
}

var level = 0

func next_level():
	level += 1
	if get_tree().change_scene("res://Scenes/Level{num}.tscn".format({"num": level})) != OK:
		pass