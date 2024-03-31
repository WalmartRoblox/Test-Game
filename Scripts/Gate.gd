extends Node2D
var levers = []
var code = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	levers = get_node("Levers").get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_code(c):
	code = c

func _on_lever_flipped():
	var lever_code = ""
	
	for lever in levers:
		lever_code += lever.status
	print(lever_code)
	if lever_code == code:
		$"StaticBody2D/CollisionShape2D".disabled = true
		$"Sprite2D".visible = false
	else:
		$"StaticBody2D/CollisionShape2D".disabled = false
		$"Sprite2D".visible = true
