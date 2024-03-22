extends Node2D
var levers = []
var code = []
var correct_levers = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	levers = get_node("Levers").get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var i = 0
	for lever in levers:
		if lever.on == code[i]:
			correct_levers += 1
		else:
			correct_levers -= 1
		i += 1
	
	if correct_levers == levers.size():
		$"StaticBody2D/CollisionShape2D".disabled = true
	else:
		$"StaticBody2D/CollisionShape2D".disabled = false

func set_code(c):
	code = c
