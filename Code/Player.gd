extends KinematicBody2D

export var SPEED = 200
export var GRAVITY = 500
export var JUMP_SPEED = 400
export var inertia = 0

var velocity = Vector2()

var jump = false

func _ready():
	global.player = self

func _process(_delta):
	if global.hud.item:
		if global.hud.item.type == "Dumbbell":
			inertia = 100
		else:
			inertia = 0

func _physics_process(delta):
	input()
	movement(delta)
	animate()

func input():
	var input_x = 0
	
	if Input.is_action_pressed("move_right"):
		input_x += 1
	if Input.is_action_pressed("move_left"):
		input_x -= 1
	
	# Drop Gift
	if Input.is_action_just_pressed("give_gift") and global.hud.item != null:
		var close_to_npc = false
		for npc in get_parent().get_node("NPCs").get_children():
			if (position - npc.position).length() <= 90:
				close_to_npc = true
		
		if get_parent().get_node("Door").can_enter and global.hud.item.type == "Key":
			global.next_level()
		else:
			if not close_to_npc:
				global.hud.item.drop_gift()
	
	# Restart Level
	if Input.is_action_just_pressed("restart"):
		if get_tree().reload_current_scene() != OK:
			print_debug("An error occured while reloading the current scene at Player.gd.")
	
	jump = false
	if Input.is_action_just_pressed("jump"):
		jump = true
	
	velocity.x = input_x * SPEED

func movement(delta):
	velocity.y += GRAVITY * delta
	
	velocity = move_and_slide(velocity, Vector2.UP,
	false, 4, PI/4, false)
	
	if is_on_floor():
		if jump:
			velocity.y = -JUMP_SPEED
		else:
			velocity.y = min(200, velocity.y)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.name == "Box":
			collision.collider.apply_central_impulse(-collision.normal * inertia)

func animate():
	if velocity.x != 0:
		$AnimatedSprite.flip_h = velocity.x < 0
	
	if abs(velocity.x) > 0.1:
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")