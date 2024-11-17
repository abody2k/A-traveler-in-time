extends Node3D


@export var state : bool = false

var player_in_range = false
var is_opened = false

func open_door():
	
	if (not is_opened) and state:
		#open the door
		$AnimationPlayer.play("open_door_animation")
		$audio.play()
		is_opened=true
		pass		#play locked door sound effect
		return
	elif is_opened:
		pass
	else:
		$audio2.play()
		#play open animation
		#play sound of opening a door

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and player_in_range:
		open_door()
	
	pass


func _on_area_3d_body_exited(body):
	player_in_range=false
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	player_in_range=true
