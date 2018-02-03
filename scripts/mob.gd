extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var maxspeed=100

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	mob=get_node("AnimatedSprite")
	set_process(true)
	
func _process(delta):
	pass
	#print(get_parent().get_node("RigidBody2D/player").get_pos().y)
