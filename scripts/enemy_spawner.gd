extends Node2D

signal enemy_spawned(enemy_instance: Node)
signal path_enemy_spawned(path_enemy_instance: Node)

var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")

@onready var timer = $Timer
@onready var path_enemy_timer = $PathEnemyTimer
@onready var spawn_positions = $SpawnPositions

func _ready() -> void:
	# Connect the signal to the function
	timer.connect("timeout", _on_timer_timeout)
	path_enemy_timer.connect("timeout", _on_path_enemy_timer_timeout)

func _on_timer_timeout() -> void:
	spawn_enemy()

func _on_path_enemy_timer_timeout() -> void:
	spawn_path_enemy()
	
func spawn_enemy():
	# Get a random spawn position
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	# Create a new enemy instance
	var enemy_instance = enemy_scene.instantiate()	
	enemy_instance.global_position = random_spawn_position.global_position
	# Add the enemy instance to the scene
	enemy_spawned.emit(enemy_instance)

func spawn_path_enemy():
	# Get path enemy instance
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)