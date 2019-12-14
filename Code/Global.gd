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
	"Present": Vector2(1.5, 1.5),
	"Key": Vector2(2, 2)
}