extends CanvasLayer
var hearts = 9
var maxhearts= 9
@onready var player=get_parent().get_node("Cat")
@onready var Hearts=$Hearts

# Called when the node enters the scene tree for the first time.
func _ready():
	if player != null:
		player.hit.connect(heart_change)
		player.dead.connect(died)
	Hearts.size.x=hearts*29
	$Died.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func heart_change(value):
	hearts = value
	if hearts >=0:
		if hearts<= maxhearts:
			Hearts.size.x=hearts*29

func died():
	Hearts.size.x=9*29
	$Died/Timer.start()
	$Died.show()
	
func _on_timer_timeout():
	$Died.hide()
