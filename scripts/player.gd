extends CharacterBody2D

var speed = 300

func _physics_process(delta: float) -> void:
	# Move the player based on input
	velocity = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed

	move_and_slide()

	var screen_size = get_viewport().size
	# Make sure player isn't able to exit game window
	global_position = global_position.clamp(Vector2.ZERO, screen_size)