extends CharacterBody2D

@export var speed= 60000#speed
@export var GRAVITY = 1700#gravit
@export var jump = 95000 #jump force
@export var termVol =1000#terminal velocity
@export var acc = 50
var jumped = false
var heli_hat = false
var heli_jumps=1

@onready var axis = Vector2.ZERO

var health = 9
signal hit(health)
signal dead()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#gravity
	velocity.y += GRAVITY * delta
	#base movement
	
		
	#wall sliding
	if (is_on_wall()):
		termVol =100
	else:
		termVol=1000
	if(velocity.y>termVol):
		velocity.y = termVol
	
	if(heli_hat):
		$AnimatedSprite2D/Hat.show()
	#player control and info
	movement(delta)
	jumping(delta)
	if(is_on_floor() or is_on_wall()):
		heli_jumps=1
	if(get_input_direction()>=0):
		$AnimatedSprite2D.flip_h=false
	else:
		$AnimatedSprite2D.flip_h=true
	if(get_input_direction()==0):
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("run")
	move_and_slide()
	interact()
	debugInfo()
#to add a cooldown on jumping so the player can't spam jump
func get_input_direction():
	var input_dir = Vector2.ZERO
	input_dir = (Input.get_action_strength("walk_right") -Input.get_action_strength("walk_left"))
	return input_dir
func movement(delta):
	velocity.x = get_input_direction() * speed *delta
func interact():
	if (Input.is_action_just_pressed("interact")):
		for body in $"Intereaction_Vicinity".get_overlapping_areas():
			if body.is_in_group("keys"):
				body.queue_free()
func debugInfo():
	$Label.set_text("gravity: " + str(GRAVITY)+
				"\nspeed: " + str(speed)+
				"\ntermVol: " + str(termVol)+
				"\njump: " + str(jump)+
				"\nHealth: " + str(health)+
				"\naxis num:" + str(get_input_direction()))
func _on_area_2d_area_entered(area):
	if(area.name=="EnemyColision" or area.name=="WaterArea"):
		health -=1
		hit.emit(health)
		if(health==0):
			dead.emit()
			health =9
		if area.name=="Water":
			velocity.y = -1500	
	print("hit "+ area.name)
func jumping(delta):
	if(Input.is_action_just_pressed("jump") and $Jump_timer.is_stopped()):
		if(is_on_floor()):
			$AnimatedSprite2D.play("jump")
			$Jump.play()
			velocity.y =-jump *delta
			jumped=true
			$jump_timer.start()
			
		elif(is_on_wall()):
			$AnimatedSprite2D.play("jump")
			$Jump.play()
			jumped=true
			$jump_timer.start()
			velocity.y =-jump *delta
			if(get_input_direction()==-1):
				velocity.x+=200
			elif(get_input_direction()==1):
				velocity.x+=-200 
			
		if(heli_hat and heli_jumps>0):
			$AnimatedSprite2D.play("jump")
			$Jump.play()
			heli_jumps-=1
			velocity.y = -jump *delta
			jumped = false
			$jump_timer.start()
func setHealth(value):
	health = value
