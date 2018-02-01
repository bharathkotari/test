extends RigidBody2D
export var speed = 100
export var jump=50
var feet
var player
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	player =get_node("Sprite 2")
	feet= get_node("RayCast2D")
	feet.add_exception(self)
	#player.set_blend_mode(1)


func _process(delta):
	if feet.is_colliding():
		if Input.is_action_pressed("ui_up"):
			set_axis_velocity(Vector2(0,-jump))
		if Input.is_action_pressed("ui_right"):
			set_axis_velocity(Vector2(speed,0))
		if Input.is_action_pressed("ui_left"):
			set_axis_velocity(Vector2(-speed,0))
	