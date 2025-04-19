extends Area2D

@export var speed = 200

func _physics_process(delta: float) -> void:
	# Move the enemy to the left
	global_position.x -= speed * delta

func die() -> void:
	# Remove the enemy from the scene
	queue_free()