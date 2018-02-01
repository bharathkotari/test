extends RigidBody2D
export var speed = 100
export var jump=50
var feet
var player
var flipped
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	player =get_node("player")
	feet= get_node("RayCast2D")
	feet.add_exception(self)
	#player.set_blend_mode(1)


func _process(delta):
	if feet.is_colliding():
		
		if Input.is_action_pressed("ui_up"):
			set_axis_velocity(Vector2(0,-jump))
			player.set_animation("attack")
		
		elif Input.is_action_pressed("ui_right"):
			set_axis_velocity(Vector2(speed,0))
			player.set_animation("walk_left")
			flipped=1
			player.set_flip_h(true)
			
		elif Input.is_action_pressed("ui_left"):
			set_axis_velocity(Vector2(-speed,0))
			if flipped==1 :
				player.set_flip_h(false)
			player.set_animation("walk_left")
		else:
			player.set_animation("idle")
		

	