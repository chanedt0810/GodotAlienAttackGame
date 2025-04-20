extends Control

@onready var retry_button = $Panel/RetryButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	retry_button.connect("pressed", _on_retry_button_pressed)

func set_score(score: int) -> void:
	$Panel/Score.text = "Score: " + str(score)

func _on_retry_button_pressed() -> void: 
	# Restart the game
	get_tree().reload_current_scene()
	# Optionally, you can also reset any global game state here
	# For example, resetting score or lives if they are stored in a singleton
	# GlobalGameState.reset()
