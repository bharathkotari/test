extends RigidBody2D
export var speed = 100
export var acc =2
export var jump=50
var health=500
var attack=20
var feet
var feet_left
var feet_right
var player
var flipped
var cam
var bigone
var time =0
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	bigone = get_node(".")
	bigone.add_to_group("player")
	player =get_node("player")
	feet= get_node("RayCast2D")
	feet.add_exception(self)
	feet_left=get_node("RayCast2D1")
	feet_left.add_exception(self)
	feet_right=get_node("RayCast2D2")
	feet_right.add_exception(self)
	cam=get_node("Camera2D")
	cam.set_zoom((Vector2(400/get_node("player").get_viewport_rect().size.x,400/get_node("player").get_viewport_rect().size.x)))
	#player.set_blend_mode(1)

func dead():
	
	#bigone.remove_from_group("player")
	#set_axis_velocity(Vector2(speed+acc*time,0))
	#set_axis_velocity(Vector2(speed,-jump))
	bigone.set_hidden(true)
	bigone.add_to_group("dead")
	player.set_animation("dead")
	#player.stop()
	
	
	#get_node("player").remove_and_skip()
	#get_parent().get_node("mob/villain").set_animation("walk_left")
	
	
	
func _process(delta):
	
	if feet.is_colliding() or feet_left.is_colliding() or feet_right.is_colliding():
		
		if Input.is_action_pressed("ui_up"):
			if Input.is_action_pressed("ui_right"):
				set_axis_velocity(Vector2(speed+acc*time,-jump))
			elif Input.is_action_pressed("ui_left"):
				set_axis_velocity(Vector2(-speed-acc*time,-jump))
			else:
				set_axis_velocity(Vector2(0,-jump))
			player.set_animation("jump")
		
		elif Input.is_action_pressed("ui_right"):
			time+=1
			set_axis_velocity(Vector2(speed+acc*time,0))
			
			player.set_animation("walk")
			flipped=1
			player.set_flip_h(false)
			
		elif Input.is_action_pressed("ui_left"):
			time+=1
			set_axis_velocity(Vector2(-speed-acc*time,0))
			if flipped==1 :
				player.set_flip_h(true)
			player.set_animation("walk")
		elif Input.is_action_pressed("ui_attack"):
			if flipped==1:
				player.set_flip_h(true)
			else:
				player.set_flip_h(false)
			player.set_animation("attack")
		else:
			time =0
			player.set_animation("idle")
	if health <=0:
		dead()
		

	