extends Node2D

var lives = 3
var score = 0

var game_over_scene = preload("res://scenes/game_over_screen.tscn")

@onready var death_zone = $DeathZone
@onready var player = $Player
@onready var enemy_spawner = $EnemySpawner
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_hit_sound = $PlayerHitSound

func _ready() -> void:
	death_zone.connect("area_entered", _on_death_zone_area_entered)
	player.connect("took_damage", _on_player_took_damage)
	enemy_spawner.connect("enemy_spawned", _on_enemy_spawner_enemy_spawned)
	hud.set_score_label(score)
	hud.set_lives_left_label(lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.queue_free()

func _on_player_took_damage() -> void:
	# Take life from player
	lives -= 1
	hud.set_lives_left_label(lives)
	player_hit_sound.play()
	# Check if player is dead
	if lives == 0:
		player.die()

		await get_tree().create_timer(0.5).timeout

		var game_over_instance = game_over_scene.instantiate()
		ui.add_child(game_over_instance)
		game_over_instance.set_score(score)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Node) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	# Add the enemy instance to the scene
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	# Increase score when an enemy dies	
	score += 100
	hud.set_score_label(score)
	enemy_hit_sound.play()
