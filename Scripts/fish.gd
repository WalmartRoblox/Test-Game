extends Node2D
@onready var player=get_parent().get_node("Cat")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_fish_area_entered(area):
	if(area.name == "Intereaction_Vicinity"):
		if(player.health<9):
			player.health+=1
			queue_free()
			player.hit.emit(player.health)
