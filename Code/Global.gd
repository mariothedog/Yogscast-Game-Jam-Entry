extends Node

#warning-ignore-all:unused_class_variable

var player
var hud

var textures = {
	"Present": load("res://Art/Gifts/Present.png"),
	"Key": load("res://Art/Gifts/Key.png"),
	"Dumbbell": load("res://Art/Gifts/Dumbbell.png"),
	"Present2": load("res://Art/Gifts/Present2.png")
}

var vframes = {
	"Present": 1,
	"Key": 5,
	"Dumbbell": 1,
	"Present2": 1
}

var hframes = {
	"Present": 1,
	"Key": 3,
	"Dumbbell": 1,
	"Present2": 1
}

var scales = {
	"Present": Vector2(1.1, 1.1),
	"Key": Vector2(1.5, 1.5),
	"Dumbbell": Vector2(1, 1),
	"Present2": Vector2(1.1, 1.1)
}

var hud_scales = {
	"Present": Vector2(1.5, 1.5),
	"Key": Vector2(2, 2),
	"Dumbbell": Vector2(2, 2),
	"Present2": Vector2(1.5, 1.5)
}

var level = 0

func next_level():
	level += 1
	if get_tree().change_scene("res://Scenes/Level{num}.tscn".format({"num": level})) != OK:
		pass