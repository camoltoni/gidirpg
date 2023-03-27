extends KinematicBody2D

const MAX_SPEED = 100
const ACCEL = 3.0

var velocity = Vector2()

func _physics_process(_delta):
	var input_vector = Vector2()
	
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	input_vector = input_vector.normalized()
	
	if input_vector.length_squared():
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCEL)
		$AnimTree.set("parameters/Idle/blend_position", input_vector)
		$AnimTree.set("parameters/Walk/blend_position", input_vector)
		$AnimTree["parameters/playback"].travel("Walk")
	else:
		velocity = velocity.move_toward(Vector2(), ACCEL * 2.0)
		$AnimTree["parameters/playback"].travel("Idle")
	
	velocity = move_and_slide(velocity)
