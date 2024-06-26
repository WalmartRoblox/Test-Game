extends Node2D
var speed
@onready var player = $Cat
@onready var camera = $Camera2D
var spawn_position = Vector2(-1300,50)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("Respawn")):
		player.set_position(spawn_position)
	camera.set_offset(player.get_position())
	
func _on_respawn_level_body_entered(body):
	player.set_position(spawn_position)
	camera.set_offset(player.get_position())

func _on_cat_dead():
	player.set_position(spawn_position)


func _on_level_1_change_to_level_2():
		#loads the level 2 onto the world scene
	var level2_ressource = load("res://Scenes/level_2.tscn") 
	var level2_node = level2_ressource.instantiate() 
	self.add_child(level2_node)
	
	#moves newly added node to the same location as the previous level node
	move_child($level2, 0)
	
	#sets the new spawn position for level 2
	spawn_position = Vector2(399,269)

	#sets new player position
	player.set_position(spawn_position)
	camera.set_offset(player.get_position())
	
	level2_node.change_to_level3.connect(_on_level_2_change_to_level_3)
	

func _on_level_2_change_to_level_3():
		#loads the level 2 onto the world scene
	var level3_ressource = load("res://Scenes/level_3.tscn") 
	var level3_node = level3_ressource.instantiate() 
	self.add_child(level3_node)
	
	#moves newly added node to the same location as the previous level node
	move_child($level3, 0)
	
	#sets the new spawn position for level 2
	spawn_position = Vector2(-265, -48)
	#sets new player position
	player.set_position(Vector2(-265, -48))
	camera.set_offset(player.get_position())
