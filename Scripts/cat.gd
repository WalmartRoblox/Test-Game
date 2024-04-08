extends CharacterBody2D

@export var speed= 400 #speed
@export var GRAVITY = 20#gravit
@export var jump = 600 #jump force
@export var termVol =1000#terminal velocity
@export var acc = 50
var jumped = false

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
	velocity.y += GRAVITY
	#base movement
	
		
	#wall sliding
	if (is_on_wall()):
		termVol =100
	else:
		termVol=1000
	if(velocity.y>termVol):
		velocity.y = termVol
		
	#player control and info
	movement()
	jumping()
	if(get_input_direction()>0):
		$AnimatedSprite2D.flip_h=false
	else:
		$AnimatedSprite2D.flip_h=true
	move_and_slide()
	interact()
	debugInfo()
#to add a cooldown on jumping so the player can't spam jump
func _on_jump_timer_timeout():
	
	$jump_timer.stop()
	
func get_input_direction():
	var input_dir = Vector2.ZERO
	input_dir = (Input.get_action_strength("walk_right") -Input.get_action_strength("walk_left"))
	return input_dir
func movement():
	$AnimatedSprite2D.play("run")
	velocity.x = get_input_direction() *speed
	if(get_input_direction() ==0 and not jumped):
		$AnimatedSprite2D.play("idle")
		
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
				"\nHealth: " + str(health))
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
func jumping():
	if(Input.is_action_just_pressed("jump")):
		jumped = true
		$AnimatedSprite2D.play("jump")
		if(is_on_floor()):
			velocity.y=-jump
		elif(is_on_wall()):
			velocity.y=-jump
func setHealth(value):
	health = value
