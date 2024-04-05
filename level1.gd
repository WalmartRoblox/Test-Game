extends Node2D
signal change_to_level2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_door_leave():
	change_to_level2.emit()
	self.queue_free()	
