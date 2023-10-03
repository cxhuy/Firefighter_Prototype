extends CharacterBody2D

const speed = 100

@onready var anim = get_node("AnimatedSprite2D")
var WATER = preload("res://Scenes/water.tscn")

func _physics_process(delta):
	character_movement(delta)
	
func spray_water():
	if WATER:
		var water = WATER.instantiate()	
		get_tree().current_scene.add_child(water)
		water.global_position = self.global_position
		
		var water_rotation = self.global_position.direction_to(get_global_mouse_position()).angle()
		water.rotation = water_rotation
	
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
	elif Input.is_action_pressed("action_water"):
		spray_water()
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
