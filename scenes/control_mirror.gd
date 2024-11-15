extends Camera3D


var cam : Camera3D
# Called when the node enters the scene tree for the first time.
func _ready():
	cam = get_tree().get_first_node_in_group("cam")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation.x = cam.rotation.x
	rotation.y = cam.get_parent().rotation.y
	pass
