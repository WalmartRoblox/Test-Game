extends Node2D
signal change_to_level2
@onready var player=get_parent().get_node("Cat")

# Called when the node enters the scene tree for the first time.
func _ready():
	player.dead.connect(died)
	$Level1Music.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_door_leave():
	change_to_level2.emit()
	self.queue_free()	

func _on_respawn_level_area_entered(area):
	if(area.name =="CatArea"):
		player.position = Vector2(-1194,-17)

func died():
	player.position = Vector2(-1194,-17)
