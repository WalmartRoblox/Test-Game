extends CharacterBody2D

@export var speed= 400 #speed
@export var gravity = 20#gravit
@export var jump = 600 #jump force
@export var termVol =1000#terminal velocity

var health : float
var MAX_HEALTH := 9

signal hit(health)
signal dead()

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var jumpRight=0
	var jumpLeft=0
	var horizontal_direction = Input.get_axis("walk_left","walk_right")
	
	if !is_on_floor(): #when the player isn't on the floor, have gravity pull them down
		velocity.y += gravity
		
	#Wall Slide
	if(is_on_wall()):
		termVol = 100
	else:
		termVol=1000
	#Wall jumping
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y -= jump
			print("test 1")
		if is_on_wall() and Input.is_action_pressed("walk_left"):
			velocity.y -= jump
			print("test 2")
		if is_on_wall() and Input.is_action_pressed("walk_right"):
			velocity.y -= jump
			print("test 3")
			
#	#so you dont fall too fast
	if(velocity.y>= termVol):
		velocity.y=termVol
	$Label.set_text("gravity: " + str(gravity)+
					"\nspeed: " + str(speed)+
					"\ntermVol: " + str(termVol)+
					"\njump: " + str(jump)+
					"\nHealth: " + str(health))
					
	velocity.x = speed *horizontal_direction
	if (Input.is_action_just_pressed("interact")):
		print("interaction")
		for body in $"Intereaction_Vicinity".get_overlapping_areas():
			if body.is_in_group("keys"):
				print("got key")
				body.queue_free()
	
	move_and_slide() #moves the player

#to add a cooldown on jumping so the player can't spam jump
func _on_jump_timer_timeout():
	$jump_timer.stop()

#detects when enemy collides with player
func _on_area_2d_area_entered(area):
	if(area.name=="EnemyColision"):
		health -=1
		hit.emit(health)
		if(health==0):
			dead.emit()
			health =9
	print("hit "+ area.name)

func setHealth(value):
	health = value
