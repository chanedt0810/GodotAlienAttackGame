extends Node2D

@onready var death_zone = $DeathZone

func _ready() -> void:
	death_zone.connect("area_entered", _on_death_zone_area_entered)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()