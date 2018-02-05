extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var maxspeed=2
var mob
var player
var damage =10
var health =100
var velocity =Vector2()
var gravity = 20000.0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	mob = get_node("villain")
	player =get_parent().get_node("RigidBody2D")
	set_fixed_process(true)
	
func _fixed_process(delta):
	velocity.y=delta*gravity
	var motion= velocity*delta
	move(motion)
	var direction=(player.get_global_pos()-mob.get_global_pos()).normalized()
	direction.y=0
	move(direction*maxspeed)
	var dif = player.get_global_pos().x-mob.get_global_pos().x
	#print (dif)
	if dif < 25 and dif > -40:
		if dif > 0:
			mob.set_flip_h(true)
		else :
			mob.set_flip_h(false)
		mob.set_animation("attack")
		get_parent().get_node("RigidBody2D").health=get_parent().get_node("RigidBody2D").health-damage
	else:
		mob.set_animation("walk_left")
	
