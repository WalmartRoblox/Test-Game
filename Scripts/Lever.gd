extends Node2D

@export var status = "0"
var within_vincinity = false
signal flipped

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("off")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and within_vincinity:
		if self.status == "1":
			$AnimatedSprite2D.play("off")
			flipped.emit()
			self.status = "0"
		else:
			$AnimatedSprite2D.play("on")
			flipped.emit()
			self.status = "1"

func _on_interaction_vincinity_area_entered(area):
	self.within_vincinity = true

func _on_interaction_vincinity_area_exited(area):
	self.within_vincinity = false
