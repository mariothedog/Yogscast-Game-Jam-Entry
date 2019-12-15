extends Area2D

var can_enter = false

func _on_Door_body_entered(_body):
	can_enter = true

func _on_Door_body_exited(_body):
	can_enter = false