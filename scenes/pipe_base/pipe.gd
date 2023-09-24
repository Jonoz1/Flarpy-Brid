extends Node2D

signal scored

@onready var speed

func _process(delta):
	position.x -= speed * delta
	
	if global_position.x < -60:
		queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "Brid":
		scored.emit()
