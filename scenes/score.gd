extends CanvasLayer

@onready var pipe_manager = $"../PipeManager"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/MarginContainer/Label.text = str(pipe_manager.score)
