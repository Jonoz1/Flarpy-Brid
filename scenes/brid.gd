extends RigidBody2D

@export var flap_strength = 750
@export var gravity = 1.5

func _ready():
	gravity_scale = gravity

func _process(_delta):
	flap()

func flap():
	if Input.is_action_just_pressed("flap"):
		linear_velocity.y = -flap_strength
