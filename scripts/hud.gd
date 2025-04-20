extends Control

@onready var score = $Score
@onready var livesLeft = $LivesLeft

func set_score_label (new_score: int) -> void:
	# Update the score label with the new score
	score.text = "SCORE: " + str(new_score)

func set_lives_left_label (new_lives: int) -> void:
	# Update the lives label with the new lives
	livesLeft.text = str(new_lives)