extends KinematicBody2D

var velocity = Vector2()

func _physics_process(delta):
	var input_vector = Vector2()
	
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	if input_vector.length_squared():
		velocity = input_vector
	else:
		velocity = Vector2()
	
	move_and_collide(velocity)
