extends Node3D

enum creature_type {MOVING, STATIC}

@export var type : creature_type
@export var pos1 : Node3D
@export var pos2 : Node3D
# Called when the node enters the scene tree for the first time.

func tween_to_start():
	var x = get_tree().create_tween()
	x.finished.connect(tween_to_end)
	x.tween_property(self,"global_position",pos1,5)	
	
func tween_to_end():
	var x = get_tree().create_tween()
	x.finished.connect(tween_to_start)
	x.tween_property(self,"global_position",pos2,5)	
	
func _ready():
	$timeline_creature/AnimationPlayer.play("timeline_creature")
	
	if type == creature_type.MOVING:
		tween_to_start()
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
