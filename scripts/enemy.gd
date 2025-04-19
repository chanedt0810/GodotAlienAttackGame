extends Area2D

signal died
@export var speed = 200

func _ready() -> void:
	# Connect the signal to the function
	self.connect("body_entered", _on_body_entered)

func _physics_process(delta: float) -> void:
	# Move the enemy to the left
	global_position.x -= speed * delta

func die() -> void:
	emit_signal("died")
	# Remove the enemy from the scene
	queue_free()

func _on_body_entered(body: Node) -> void:
	body.take_damage()
	die()