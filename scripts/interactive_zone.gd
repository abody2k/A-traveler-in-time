extends Area3D

enum TypesOfInteractions {TIME_TRAVELING_MACHINE,ROUTER,LOCKED_DOOR,UNLOCKED_DOOR};
@export  var typeOfInteraction : TypesOfInteractions;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#check if this is the main character if so show the correct interaction UI
	
	match typeOfInteraction:
		
		#TO DO RN, add all the other cases
		#in time traveling machine show the UI that makes the user time travel to
		#a speicific date and time which such UI doesn't exist yet lol
		TypesOfInteractions.TIME_TRAVELING_MACHINE:
			print("") 
	
	
	pass # Replace with function body.


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	#if it's the mc hide the interaction UI
	
	pass # Replace with function body.
