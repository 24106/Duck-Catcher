extends Area2D

# controls how quickly the duck accelerates as it falls
var acceleration: float = 200.0

# the duck's current falling speed
var velocity: float = 80.0

# give the duck a random rotation speed
var rotation_velocity: float = randf_range(-8.0, 8.0)

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
