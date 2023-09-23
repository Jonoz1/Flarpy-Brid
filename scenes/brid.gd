extends RigidBody2D

@export var flap_strength = 750
@export var gravity = 1.5

func _ready():
	gravity_scale = gravity

func _process(_delta):
	flap()

func flap():
	if $"../PipeManager".process_mode != Node.PROCESS_MODE_DISABLED:
		if Input.is_action_just_pressed("flap"):
			linear_velocity.y = -flap_strength
			
			$"Unitytut-birdwingup".visible = false
			$"Unitytut-birdwingdown".visible = true
			$FlapTimer.start()

func _on_flap_timer_timeout():
	$"Unitytut-birdwingup".visible = true
	$"Unitytut-birdwingdown".visible = false


func _on_area_2d_body_entered(body):
	if body.name != "Brid":
		await get_tree().create_timer(0.05).timeout
		$"../PipeManager".process_mode = Node.PROCESS_MODE_DISABLED
