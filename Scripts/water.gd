extends Area2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	if speed < 50:
		queue_free()
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += speed * direction * delta
	speed *= 0.95
	print(speed)
