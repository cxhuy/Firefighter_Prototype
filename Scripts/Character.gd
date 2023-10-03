extends CharacterBody2D

const speed = 100

@onready var anim = get_node("AnimatedSprite2D")

func _physics_process(delta):
	character_movement(delta)
	
func character_movement(delta):
	if Input.is_action_pressed("ui_right"):
		anim.flip_h = false
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		anim.flip_h = true
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		velocity.x = 0
		velocity.y = -speed
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
