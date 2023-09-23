extends CanvasLayer

@onready var pipe_manager = $"../PipeManager"

@onready var highscore = 0
@onready var save_path = "user://highscore.save"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var score = pipe_manager.score
	$Control/MarginContainer/Label.text = str(score)
	
	load_highscore()
	if score > highscore:
		highscore = score
		save_highscore()
	$"../PauseMenu/%Highscore".text = "HIGHSCORE: %s" %highscore

func save_highscore():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(highscore)
	file.close()

func load_highscore():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		highscore = file.get_var()
		file.close()
	else:
		highscore = 0

