extends Area3D

enum TypesOfInteractions {ROUTER,LOCKED_DOOR,UNLOCKED_DOOR,DIALOG};
@export  var typeOfInteraction : TypesOfInteractions;
@export var content : String
var player_is_inside= false
const dialog_template = preload("res://scenes/dialog.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.content= content
	$Control.dialog_deleted.connect(func (): queue_free())
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(player_is_inside and Input.is_action_just_pressed("interact")):

		if $Control.visible:
			return
				
		$Control.show_dialog()
		$Control.set_process(true)
		
		
		match typeOfInteraction:

			TypesOfInteractions.ROUTER:

				
				
				#get_tree().current_scene
				pass
		pass
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	player_is_inside=true
	#check if this is the main character if so show the correct interaction UI
	
	#match typeOfInteraction:
		#
		##TO DO RN, add all the other cases
		##in time traveling machine show the UI that makes the user time travel to
		##a speicific date and time which such UI doesn't exist yet lol
		#TypesOfInteractions.TIME_TRAVELING_MACHINE:
			#print("") 
			
	match typeOfInteraction:
		
		TypesOfInteractions.DIALOG:
			pass
			
		
	
	
	pass # Replace with function body.


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	player_is_inside=false
	#if it's the mc hide the interaction UI
	
	pass # Replace with function body.
