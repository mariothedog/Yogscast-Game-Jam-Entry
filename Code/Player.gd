extends KinematicBody2D

export var SPEED = 200
export var GRAVITY = 500
export var JUMP_SPEED = 400

var velocity = Vector2()

var jump = false

func _ready():
	global.player = self

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
		
		if not close_to_npc:
			global.hud.item.drop_gift()
	
	jump = false
	if Input.is_action_just_pressed("jump"):
		jump = true
	
	velocity.x = input_x * SPEED

func movement(delta):
	velocity.y += GRAVITY * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		if jump:
			velocity.y = -JUMP_SPEED
		else:
			velocity.y = min(200, velocity.y)

func animate():
	if velocity.x != 0:
		$AnimatedSprite.flip_h = velocity.x < 0
	
	if abs(velocity.x) > 0:
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")