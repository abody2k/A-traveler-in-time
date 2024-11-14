extends Control

enum Dialog_type {ONE_TIME,MULTIPLE_TIMES}
@export var content : String
@export var type : Dialog_type
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func show_dialog():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interact_pressed():
	
	#if it's a one time thing destroy the UI or else just Hide it and make the text 0
	
	if type == Dialog_type.ONE_TIME:
		queue_free()
	else :
		$Panel/text.visible_ratio=0
		visible=false
		
	
	pass # Replace with function body.
