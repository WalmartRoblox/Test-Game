extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_key_key_collected():
	self.visible = true
	$/root/world/level1/TextTimer.start()
	$/root/world/level1/Area2D/CollisionShape2D.disabled = false

func _on_text_timer_timeout():
	self.visible = false
	$/root/world/level1/TextTimer.stop()
