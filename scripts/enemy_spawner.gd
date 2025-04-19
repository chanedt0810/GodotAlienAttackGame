extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var timer = $Timer
@onready var spawn_positions = $SpawnPositions

func _ready() -> void:
	# Connect the signal to the function
	timer.connect("timeout", _on_timer_timeout)

func _on_timer_timeout() -> void:
	spawn_enemy()
	
func spawn_enemy():
	# Get a random spawn position
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	# Create a new enemy instance
	var enemy_instance = enemy_scene.instantiate()	
	enemy_instance.global_position = random_spawn_position.global_position
	# Add the enemy instance to the scene
	add_child(enemy_instance)
