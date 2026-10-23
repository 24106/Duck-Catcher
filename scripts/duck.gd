extends Area2D

# signal sent when the duck falls off the screen
signal duck_missed

# controls how quickly the duck accelerates as it falls
var acceleration: float = 200.0

# the duck's current falling speed
var velocity: float = 80.0

# give the duck a random rotation speed
var rotation_velocity: float = randf_range(-8.0, 8.0)

# prevent the missed signal from being emitted more than once
var has_been_missed: bool = false

func _ready() -> void:
	# add the duck to a group so the player can recognise it
	add_to_group("ducks")

func _process(delta: float) -> void: 
	# increase the falling speed over time
	velocity += acceleration * delta
	
	# move the duck down the screen
	position.y += velocity * delta
	
	# rotate the duck as it falls
	rotation += rotation_velocity * delta
	
	# check whether the duck has fallen below the screen
	var screen_height: float = get_viewport_rect().size.y
	
	if position.y > screen_height and not has_been_missed:
		has_been_missed = true
		
		# tell the main game that a duck was missed
		duck_missed.emit()
		
		# remove the duck that fell off the screen
		queue_free()
