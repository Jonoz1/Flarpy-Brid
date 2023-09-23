extends Node2D

@onready var pipe: PackedScene = preload("res://scenes/pipe.tscn")
@export var speed = 2.5
@export var spawn_offset = 300

func _ready():
	spawn_pipe()

func spawn_pipe():
	var pipe_instance = pipe.instantiate() as Node
	pipe_instance.speed = speed
	
	var parent_manager = get_parent()
	var random_y = randi_range(parent_manager.global_position.y + spawn_offset, parent_manager.global_position.y - spawn_offset)
	pipe_instance.global_position.y = random_y
	
	add_child(pipe_instance)

func _on_spawn_timer_timeout():
	spawn_pipe()
