extends Node2D

@export var on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interact_vincinity_area_entered(area):
	if Input.is_action_just_pressed("interact"):
		if on:
			$AnimatedSprite2D.play("off")
			print("off")
			on = false
		else:
			$AnimatedSprite2D.play("on")
			print("on")
			on = true
