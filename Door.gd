extends Node2D
var can_open_door = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("Closed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interaction_vinicity_area_entered(area):
	if can_open_door:
		$AnimatedSprite2D.play("Open")


func _on_interaction_vinicinty_area_exited(area):
	$AnimatedSprite2D.play("Closed")

func _on_key_key_collected():
	can_open_door = true
