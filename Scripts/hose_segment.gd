extends RigidBody2D

var friction = 0.95

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 
	
func _physics_process(delta):
	linear_velocity *= friction
	

func _on_area_2d_body_entered(body):
	print(body.get_name())


func _on_area_2d_body_exited(body):
	print("exit")
