extends Area2D

@export var speed = 500
@onready var visible_notifier = get_node("VisibleNotifier") # $VisibleNotifier

func _ready() -> void:
	# Connect the signal to the function
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta: float) -> void:
	# print(speed * delta)
	global_position.x += speed * delta

func _on_screen_exited() -> void:
	# Remove the rocket from the scene when it exits the screen
	queue_free()