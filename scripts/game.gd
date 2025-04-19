extends Node2D

var lives = 3
@onready var death_zone = $DeathZone
@onready var player = $Player

func _ready() -> void:
	death_zone.connect("area_entered", _on_death_zone_area_entered)
	player.connect("took_damage", _on_player_took_damage)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()

func _on_player_took_damage() -> void:
	# Take life from player
	lives -= 1
	# Check if player is dead
	if lives == 0:
		player.die()