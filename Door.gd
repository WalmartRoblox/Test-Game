extends Node2D

var can_open_door = false
var keys = []
var keys_collected = 0

signal leave

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("Closed")
	keys = get_node("Keys").get_children()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (keys.size() == keys_collected):
		can_open_door = true
	if can_open_door and Input.is_action_just_pressed("interact"):
		leave.emit()

func _on_interaction_vinicity_area_entered(area):
	if can_open_door:
		$AnimatedSprite2D.play("Open")

func _on_key_key_collected():
	keys_collected += 1

func _on_interaction_vincinity_area_exited(area):
	$AnimatedSprite2D.play("Closed")
