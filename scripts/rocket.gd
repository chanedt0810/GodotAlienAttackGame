extends Area2D

@export var speed = 300

func _physics_process(delta: float) -> void:
	# print(speed * delta)
	global_position.x += speed * delta