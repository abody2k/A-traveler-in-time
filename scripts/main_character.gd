extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var cant_move =false

@export var originalPoint : Node3D



func _ready():
	pass
	

func chng_interaction_btn_state(state : bool):
	$Control.visible=state
	

func _physics_process(delta):
	if(cant_move):
		return
		
	update_timer()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
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
	
	
func update_timer():
	
	$Control/RichTextLabel.text = str(int($Timer.time_left/60))+" : " + str( int($Timer.time_left)%60)
