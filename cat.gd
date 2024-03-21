extends CharacterBody2D

@export var speed= 400 #speed
@export var gravity = 20#gravit
@export var jump = 600 #jump force
@export var termVol =1000#terminal velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var jumpRight=0
	var jumpLeft=0
	if !is_on_floor(): #when the player isn't on the floor, have gravity pull them down
		velocity.y += gravity
		
	#Wall Sl
	if(is_on_wall()):
		termVol = 100
	else:
		termVol=1000

		
	
	#currently only allows the player to jump when it's on a platform, and after a certain amount of time(cooldown)
	if (Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_wall())):
		if(is_on_wall() and Input.is_action_just_pressed("walk_right")):
			jumpRight=100
		velocity.y = -jump
		$jump_timer.start()
		$Jump.play()
	
#	#so you dont fall too fast
	if(velocity.y>= termVol):
		velocity.y=termVol
	$Label.set_text("gravity: " + str(gravity)+
					"\nspeed: " + str(speed)+
					"\ntermVol: " + str(termVol)+
					"\njump: " + str(jump))
	
	var horizontal_direction = Input.get_axis("walk_left","walk_right")
	velocity.x = speed *horizontal_direction+jumpLeft+jumpRight
	move_and_slide() #moves the player
	
	if (Input.is_action_just_pressed("interact")):
		print("interaction")
		for body in $"Intereaction_Vicinity".get_overlapping_areas():
			if body.is_in_group("keys"):
				print("got key")
				body.queue_free()
	

#to add a cooldown on jumping so the player can't spam jump
func _on_jump_timer_timeout():
	$jump_timer.stop()

