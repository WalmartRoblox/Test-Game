extends CharacterBody2D

@export var speed= 400 #speed
@export var gravity = 20#gravit
@export var jump = 600 #jump force
@export var termVol =1000#terminal velocity
var health = 9
signal hit(health)
signal dead()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var jumpRight=0
	var jumpLeft=0
	var flip
	
	
	if !is_on_floor(): #when the player isn't on the floor, have gravity pull them down
		velocity.y += gravity
		
	#Wall Sl
	if(is_on_wall()):
		termVol = 100
	else:
		termVol=1000
	
	#checks if moving left
	if (Input.is_action_just_pressed("walk_left")):
		flip = true
	else:
		flip = false
	#currently only allows the player to jump when it's on a platform, and after a certain amount of time(cooldown)
	if (Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_wall())):
		velocity.y = -jump
		$jump_timer.start()
		$Jump.play()
		$AnimatedSprite2D.flip_h = flip
		$AnimatedSprite2D.play("jump")
	elif (Input.is_action_just_pressed("walk_right") or Input.is_action_just_pressed("walk_left")):
		$AnimatedSprite2D.flip_h = flip
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	
#	#so you dont fall too fast
	if(velocity.y>= termVol):
		velocity.y=termVol
	$Label.set_text("gravity: " + str(gravity)+
					"\nspeed: " + str(speed)+
					"\ntermVol: " + str(termVol)+
					"\njump: " + str(jump)+
					"\nHealth: " + str(health))
	
	var horizontal_direction = Input.get_axis("walk_left","walk_right")
	velocity.x = speed *horizontal_direction+jumpLeft+jumpRight
	move_and_slide() #moves the player
	
	if (Input.is_action_just_pressed("interact")):
		for body in $"Intereaction_Vicinity".get_overlapping_areas():
			if body.is_in_group("keys"):
				body.queue_free()
	

#to add a cooldown on jumping so the player can't spam jump
func _on_jump_timer_timeout():
	$jump_timer.stop()


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
