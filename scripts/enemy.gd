extends Area2D

@export var speed = 200

func _ready() -> void:
	# Connect the signal to the function
	self.connect("body_entered", _on_body_entered)

func _physics_process(delta: float) -> void:
	# Move the enemy to the left
	global_position.x -= speed * delta

func die() -> void:
	# Remove the enemy from the scene
	queue_free()

func _on_body_entered(body: Node) -> void:
	body.take_damage()
	die()