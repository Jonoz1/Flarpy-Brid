extends CanvasLayer

@onready var is_paused = false
@onready var is_fullscreen = false

@onready var full_screen_button = $Control/MarginContainer3/FullScreen

@onready var config_path := "user://config.cfg"

func _ready():
	load_config()

func _process(_delta):
	toggle_pause()
	set_pause_visible()
	
	# restart level
	if Input.is_key_pressed(KEY_R):
		_on_restart_button_pressed()
	
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

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

func _on_full_screen_toggled(button_pressed):
	if button_pressed:
		is_fullscreen = true
		save_config()
	else:
		is_fullscreen = false
		save_config()

func save_config():
	var config := ConfigFile.new()
	config.load(config_path)
	
	# save fullscreen
	config.set_value("settings", "fullscreen", is_fullscreen)
	
	config.save(config_path)

func load_config():
	var config := ConfigFile.new()
	config.load(config_path)
	
	# fullscreen + button
	is_fullscreen = config.get_value("settings", "fullscreen")
	full_screen_button.action_mode = is_fullscreen
