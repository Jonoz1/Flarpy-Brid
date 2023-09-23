extends Node2D

@onready var speed

func _process(delta):
	position.x -= speed
	
	if global_position.x < -60:
		queue_free()
