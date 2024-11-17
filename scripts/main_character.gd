extends CharacterBody3D


const SPEED = 50.0
const JUMP_VELOCITY = 4.5
var cant_move =false
var can_count=true

@export var originalPoint : Node3D
const dialog_template = preload("res://scenes/dialog.tscn")


func show_dialog(content:String, fun = null):
	var dialog = dialog_template.instantiate()
	dialog.content = content
	add_child(dialog)
	if fun :
		dialog.fun=fun
		pass
	dialog.show_dialog()
	dialog.set_process(true)
	pass
	
	
func timer_starter():
	get_parent().get_node("Magical_Door").visible=true
	get_parent().get_node("magic").play()
	$Timer.start()

func _ready():
	Input.mouse_mode= Input.MOUSE_MODE_CAPTURED
	show_dialog("Oh that was a long road, I wish I could make that dream I once had in the past come true, to go back in time and prevent myself from meeting them once and for all, I wish if there was like a door that takes me to the timeline world that has a very detailed instructions on how to get to where I want and what to do to fix my life",timer_starter)
	pass
	

func chng_interaction_btn_state(state : bool):

	$Control/Button.visible=state
	

func _physics_process(delta):
	if can_count:
		update_timer()
		
		
	if(cant_move):
		return
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("right", "left", "back", "forward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		$AnimationPlayer.play("mc_moving")
	else:
		$AnimationPlayer.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func disable_glow():
	$cam.environment.glow_enabled =false
	$cam.environment.glow_intensity=0
	
	$Timer.start()
	
	
func de_glow():
	var tween = get_tree().create_tween()
	tween.finished.connect(disable_glow)
	tween.tween_property($cam.environment,"glow_intensity",0,3)	
	position=originalPoint.global_position
	
func _on_timer_timeout():
	#make the screen blur and de blur in 2 seconds
	var tween = get_tree().create_tween()
	$cam.environment.glow_enabled =true
	tween.finished.connect(de_glow)
	tween.tween_property($cam.environment,"glow_intensity",5,3)
	#send the user back next to the door
	#position = originalPoint.position

	#reset the timer and start it again
	#$Timer.start()

	pass # Replace with function body.
	

func enable_dialog():
	cant_move=true
	$Control.position.y+=110
	
func disable_dialog():
	cant_move=false
	$Control.position.y-=110
func update_timer():
	
	$Control/RichTextLabel.text = str(int($Timer.time_left/60))+" : " + str( int($Timer.time_left)%60)
	
	
	
func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(-(0.5 * deg_to_rad((event as InputEventMouseMotion).relative.x)))
		$cam.rotate_x((0.5 * deg_to_rad((event as InputEventMouseMotion).relative.y)))
		$cam.rotation_degrees.x=clampf($cam.rotation_degrees.x,-30,60)
