extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = true
	$/root/world/level2/TextTimer.start(3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_text_timer_timeout():
	self.visible = false
