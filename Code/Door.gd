extends Area2D

var can_enter = false

func _on_Door_body_entered(body):
	can_enter = true

func _on_Door_body_exited(body):
	can_enter = false