extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Gate.set_code([false])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("Respawn")):
		$Cat.set_position(Vector2(-1300,50))
	$Camera2D.set_offset($Cat.get_position())

	
func _on_respawn_level_body_entered(body):
	$Cat.set_position(Vector2(-1300,50))
	$Camera2D.set_offset($Cat.get_position())
