extends KinematicBody2D

const MAX_SPEED = 100
const ACCEL = 3.0

var velocity = Vector2()

func _physics_process(delta):
	var input_vector = Vector2()
	
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	if input_vector.length_squared():
		velocity = velocity.move_toward(input_vector.normalized() * MAX_SPEED, ACCEL)
	else:
		velocity = velocity.move_toward(Vector2(), ACCEL * 2.0)
	
	move_and_collide(velocity * delta)
