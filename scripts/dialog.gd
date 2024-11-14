extends Control

enum Dialog_type {ONE_TIME,MULTIPLE_TIMES}
@export var content : String
@export var type : Dialog_type
var tween : Tween
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func show_dialog():
	visible=true
	$Panel/text.visible_ratio=0
	$Panel/text.text= content
	tween = get_tree().create_tween()
	tween.tween_property($Panel/text,"visible_ratio",1,3)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if visible:
		if Input.is_action_just_pressed("interact"):
			
			if(tween.is_running()):
				tween.stop()
				$Panel/text.visible_ratio=1
			else:
				_on_interact_pressed()
			pass
		pass
		
		
	pass


func _on_interact_pressed():
	
	#if it's a one time thing destroy the UI or else just Hide it and make the text 0
	
	if type == Dialog_type.ONE_TIME:
		queue_free()
	else :
		$Panel/text.visible_ratio=0
		visible=false
		
	
	pass # Replace with function body.
