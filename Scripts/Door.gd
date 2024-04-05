extends Node2D

var can_open_door = false
var within_vincinity = false
var keys = []
var keys_collected = 0

signal leave

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("Closed")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	keys = get_node("Keys").get_children()
	if (keys.size() == 0) and within_vincinity:
		can_open_door = true
	if can_open_door and Input.is_action_just_pressed("interact"):
		leave.emit()

func _on_interaction_vinicity_area_entered(area):
	if can_open_door:
		$AnimatedSprite2D.play("Open")
	within_vincinity = true

func _on_key_key_collected():
	keys_collected += 1

func _on_interaction_vincinity_area_exited(area):
	$AnimatedSprite2D.play("Closed")
	within_vincinity = false
