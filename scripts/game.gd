extends Node2D

var lives = 3
var score = 0
@onready var death_zone = $DeathZone
@onready var player = $Player
@onready var enemy_spawner = $EnemySpawner

func _ready() -> void:
	death_zone.connect("area_entered", _on_death_zone_area_entered)
	player.connect("took_damage", _on_player_took_damage)
	enemy_spawner.connect("enemy_spawned", _on_enemy_spawner_enemy_spawned)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()

func _on_player_took_damage() -> void:
	# Take life from player
	lives -= 1
	# Check if player is dead
	if lives == 0:
		player.die()

func _on_enemy_spawner_enemy_spawned(enemy_instance: Node) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	# Add the enemy instance to the scene
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	# Increase score when an enemy dies	
	score += 100
	print("Score: ", score)

