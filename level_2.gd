extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	$Gate.set_code("11")
	$Gate2.set_code("1")
	$Gate3.set_code("1")
	$Gate4.set_code("1")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
