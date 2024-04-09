extends PathFollow2D
signal hit
var speed=0.5
@onready var path = get_parent().get_node("Path2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	if path == null:
		pass
	$AnimatedSprite2D.play("walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio+= delta*speed

