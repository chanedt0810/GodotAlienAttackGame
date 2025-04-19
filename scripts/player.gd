extends CharacterBody2D

signal took_damage
var speed = 300
var rocket_position = 80
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = get_node("RocketContainer")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(_delta: float) -> void:
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

func shoot():
	# Create a new rocket instance
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += rocket_position

func take_damage():
	emit_signal("took_damage")

func die():
	# Remove the player from the scene
	queue_free()