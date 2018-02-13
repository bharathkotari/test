extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var maxspeed=2
var mob
var player
var damage =2
var health =100
var velocity =Vector2()
var ran =Vector2(-10,0)
var d=1
var gravity = 20000.0
var sight
var left_villain
var right_villain
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	mob = get_node("villain")
	#mob.add_to_group(mobs,false)
	player =get_parent().get_node("RigidBody2D")
	set_fixed_process(true)
	left_villain=get_node("left")
	left_villain.add_exception(self)
	right_villain=get_node("right")
	right_villain.add_exception(self)
	
	
	
	
func random_walk(delta):
	
	if left_villain.is_colliding() :
		d=1
		#print("left collide")
	elif right_villain.is_colliding():
		d=-1
		#print("right collide")
	ran.x=maxspeed*d
	ran.y=0
	move(ran)
	mob.set_animation("walk_left")
	
	
func _fixed_process(delta):
	var sight = get_node("Area2D").get_overlapping_bodies()
	velocity.y=delta*gravity
	var motion= velocity*delta
	move(motion)
	#random_walk(delta)
	
	#print (dif)
	#print (sight)
	if (sight.size()>=1):
		for obj in sight:
			if (obj.is_in_group("player")):
				var direction=(player.get_global_pos()-mob.get_global_pos()).normalized()
				direction.y=0
				move(direction*maxspeed)
				var dif = player.get_global_pos().x-mob.get_global_pos().x
				if dif < 25 and dif > -40:
					if dif > 0:
						mob.set_flip_h(true)
					else :
						mob.set_flip_h(false)
					mob.set_animation("attack")
					if get_parent().get_node("RigidBody2D").health >=0:
						get_parent().get_node("RigidBody2D").health-=damage
						
					elif get_parent().get_node("RigidBody2D").is_hidden():
						random_walk(delta)
					
						#print ("player spotted")
	
	else:
		random_walk(delta)
		#mob.set_animation("walk_left")
#	
