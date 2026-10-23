extends Node2D

@onready var duck_prefab = preload("res://duck.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_duck_spawn_timer_timeout() -> void:
	#spawn a duck
	randomize()
	var duck = duck_prefab.instantiate()
	duck.position = Vector2(randi_range(10,1024), -50)
	duck.rotation = randf_range(0,2*PI)
	add_child(duck)
