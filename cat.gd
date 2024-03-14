extends CharacterBody2D

@export var speed= 400 #speed
@export var gravity = 30#gravit
@export var jump = 500 #jump force

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_on_floor(): #when the player isn't on the floor, have gravity pull them down
		velocity.y += gravity
	
	#currently only allows the player to jump when it's on a platform, and after a certain amount of time(cooldown)
	if (Input.is_action_just_pressed("jump")) and ($jump_timer.get_time_left() == 0) and (is_on_floor()):
		velocity.y = -jump
		$jump_timer.start()
	
	var horizontal_direction = Input.get_axis("walk_left","walk_right")
	velocity.x = speed *horizontal_direction
	move_and_slide() #moves the player

#to add a cooldown on jumping so the player can't spam jump
func _on_jump_timer_timeout():
	$jump_timer.stop()
