extends Control

enum Dialog_type {ONE_TIME,MULTIPLE_TIMES}
@export var content : String
@export var type : Dialog_type
var tween : Tween


signal dialog_deleted

func _ready():
	set_process(false)

func show_dialog():
	
	$Panel/text.text= content
	$Panel/text.visible_ratio=0
	
	tween = get_tree().create_tween()
	tween.tween_property($Panel/text,"visible_ratio",1,3)
	visible=true
	pass
	
func hide_dialog():
	
	visible=false
	if(tween.is_running()):
		tween.stop()
		set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if visible and Input.is_action_just_pressed("interact"):
		print("I;m passing")	
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
		dialog_deleted.emit()
		
	else :
		$Panel/text.visible_ratio=0
		visible=false
		set_process(false)
		
	
	pass # Replace with function body.
