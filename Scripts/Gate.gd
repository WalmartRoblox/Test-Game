extends Node2D
var levers = []
var code = ""
var lever_code = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	levers = get_node("Levers").get_children()
	lever_code = ""
	for lever in levers:
		lever_code += lever.status

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if lever_code == code:
		$"StaticBody2D/CollisionShape2D".disabled = true
		$"Sprite2D".visible = false
	else:
		$"StaticBody2D/CollisionShape2D".disabled = false
		$"Sprite2D".visible = true
	
func set_code(c):
	code = c

func _on_lever_flipped():
	lever_code = ""
	for lever in levers:
		lever_code += lever.status
