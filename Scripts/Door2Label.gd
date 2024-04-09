extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $/root/world/level2/Door.keys.size() != 0:
		self.text = "There's four keyholes...\nLooks like I'll need to find more keys"
	else:
		self.text = "Seems like I have all the keys I need"


func _on_area_2d_area_entered(area):
	self.visible = true

func _on_area_2d_area_exited(area):
	self.visible = false
