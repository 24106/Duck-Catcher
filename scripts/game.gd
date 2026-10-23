extends Node2D

# load duck scene so new ducks can be created
@onready var duck_prefab = preload("res://scenes/duck.tscn")

# get the player and the score label from the scene
@onready var player: Area2D = $Player
@onready var score_label: Label = $UI/Label

# store the player's score
var score: int = 0

func _ready() -> void:
	# listen for the signal emitted when a duck is caught
	player.duck_caught.connect(_on_player_duck_caught)
	
	# display the starting score
	update_score()

func _process(delta: float) -> void:
	pass

# spawn a new duck whenever the timer finishes
func _on_duck_spawn_timer_timeout() -> void:
	var duck = duck_prefab.instantiate()
	
	# give the duck a random horizontal position above the screen
	duck.position = Vector2(
		randi_range(30, 994), 
		-50
	)
	
	# give the duck a random starting rotation
	duck.rotation = randf_range(0.0, 2.0 * PI)
	
	# add the duck to the game
	add_child(duck)

# increase the score when the player catches a duck
func _on_player_duck_caught() -> void:
	score += 1
	update_score()

# display the latest score on the screen
func update_score() -> void:
	score_label.text = "Score: " + str(score)
