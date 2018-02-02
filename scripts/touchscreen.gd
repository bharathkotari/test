extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var left_keys
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("left 2").set_pos(Vector2(0,get_node("left 2").get_viewport_rect().size.y))
	get_node("right").set_pos(Vector2(get_node("left 2").get_viewport_rect().size.x-100*get_node("left 2").get_viewport_rect().size.x/600,get_node("left 2").get_viewport_rect().size.y))
	get_node("left 2").set_scale(Vector2(get_node("left 2").get_viewport_rect().size.x/600,get_node("left 2").get_viewport_rect().size.x/600))
	get_node("right").set_scale(Vector2(get_node("left 2").get_viewport_rect().size.x/600,get_node("left 2").get_viewport_rect().size.x/600))
	#get_node("right").set_pos(Vector2(get_node("left 2").get_viewport_rect().size.x-20,get_node("left 2").get_viewport_rect().size.y))
	
	
