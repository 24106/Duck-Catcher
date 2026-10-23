extends Area2D

# signal sent to the main game when a duck is caught
signal duck_caught

# horizontal movement speed
@export var speed: float = 700.0

# keep the player away from the screen edges
@export var edge_padding: float = 54.0

func _process(delta: float) -> void:
	# read only the left and right movement controls
	var direction: float = Input.get_axis("ui_left", "ui_right")
	
	# move the player horizontally
	position.x += direction * speed * delta
	
	# keep the player inside the screen boundaries
	var screen_width: float = get_viewport_rect().size.x
	position.x = clampf(
		position.x,
		edge_padding,
		screen_width - edge_padding
	)

# detect when a duck enters the player's collision area
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("ducks"):
		# tell the main game that a duck was caught
		duck_caught.emit()
		
		# remove the caught duck
		area.queue_free()
