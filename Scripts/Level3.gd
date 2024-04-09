extends Node2D
@onready var player=get_parent().get_node("Cat")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Gate2.set_code("1")
	$Gate3.set_code("0")
	$Gate4.set_code("0")
	$Gate5.set_code("1")

	player.dead.connect(died)
	$Level3Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_respawn_level_area_entered(area):
	if(area.name =="CatArea"):
		player.position = Vector2(-265, -48)

func died():
	player.position = Vector2(-265, -48)
	


func _on_door_finished():
	$CanvasLayer/TextureRect.show()
	set_process_input(false)
