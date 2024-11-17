extends Node3D


@export var state : bool = false

var player_in_range = false

func open_door():
	
	if not state:
		#play locked door sound effect
		return
	else:
		pass
		#play open animation
		#play sound of opening a door

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
