extends Node2D

@onready var score = 0

@onready var pipe: PackedScene = preload("res://scenes/pipe.tscn")
@export var speed = 2.5
@export var spawn_y_offset = 300

@onready var is_paused = false

func _ready():
	spawn_pipe()

func spawn_pipe():
	var pipe_instance = pipe.instantiate() as Node
	pipe_instance.speed = speed
	
	# random positioning
	var parent_manager = get_parent()
	var random_y = randi_range(parent_manager.global_position.y + spawn_y_offset, parent_manager.global_position.y - spawn_y_offset)
	pipe_instance.global_position.y = random_y
	
	# score signal
	pipe_instance.connect("scored", _on_scored)
	
	add_child(pipe_instance)

func _on_spawn_timer_timeout():
	spawn_pipe()

func _on_bird():
	print("BIRD")

func _on_scored():
	score += 1
