extends MeshInstance3D


@export var cam_pos : Node3D
# Called when the node enters the scene tree for the first time.
func _ready():
	$SubViewport2/Camera3D.global_position = cam_pos.global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_3d_2_body_entered(body):
	body.global_position =cam_pos.global_position
	body.global_rotation.y+=180

	pass # Replace with function body.
