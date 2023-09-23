extends CanvasLayer

@onready var is_paused = false

func _process(_delta):
	toggle_pause()
	set_pause_visible()
	
	if Input.is_key_pressed(KEY_R):
		_on_restart_button_pressed()

func toggle_pause():
	if Input.is_action_just_pressed("ui_cancel"):
		is_paused = !is_paused

func set_pause_visible():
	if is_paused:
		visible = true
		$"..".process_mode = Node.PROCESS_MODE_DISABLED
		$"../Brid".process_mode = Node.PROCESS_MODE_DISABLED
	
	else:
		visible = false
		$"..".process_mode = Node.PROCESS_MODE_ALWAYS
		$"../Brid".process_mode = Node.PROCESS_MODE_ALWAYS

func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_exit_button_pressed():
	get_tree().quit()
