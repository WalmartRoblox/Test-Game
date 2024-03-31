extends Node2D
var speed
@onready var player = $Cat
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("Respawn")):
		player.set_position(Vector2(-1300,50))
	camera.set_offset(player.get_position())
	
func _on_respawn_level_body_entered(body):
	player.set_position(Vector2(-1300,50))
	camera.set_offset(player.get_position())


func _on_cat_dead():
	player.set_position(Vector2(-1300,50))
	
