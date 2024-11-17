extends Control

enum Dialog_type {ONE_TIME,MULTIPLE_TIMES,AUTO_SHOW}
@export var content : String
@export var type : Dialog_type
var tween : Tween
var fun : Callable


signal dialog_deleted

func _ready():
	
	set_process(false)

func show_dialog():
	
	$Panel/text.text= content
	$Panel/text.visible_ratio=0
	
	tween = get_tree().create_tween()
	tween.tween_property($Panel/text,"visible_ratio",1,3)
	visible=true
	get_tree().call_group("mc","enable_dialog")
	
	pass
	
func hide_dialog():
	if tween != null:
		if(tween.is_running()):
			tween.stop()
	visible=false
	$Panel/text.visible_ratio=0
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if visible and Input.is_action_just_pressed("interact"):
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
	
	
	get_tree().call_group("mc","disable_dialog")
	
	match type:
		Dialog_type.ONE_TIME:
			dialog_deleted.emit()
		Dialog_type.MULTIPLE_TIMES:
			$Panel/text.visible_ratio=0
			visible=false
			set_process(false)
		Dialog_type.AUTO_SHOW:
			print(fun)
			if fun :
				fun.call()
			queue_free()
			


		
	
	pass # Replace with function body.
