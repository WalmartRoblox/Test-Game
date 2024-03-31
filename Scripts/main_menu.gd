extends CanvasLayer
@onready var player = get_parent().get_node("Cat")
var escape = false
var start = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$KeybindsLabel.hide() # Hide Keybinds when the menu is run
	$BackButton.hide() # Hide back button when menu is run

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Menu") and start:
		if escape:
			$QuitButton.hide()
			escape = false
		elif !escape:
			$QuitButton.show()
			escape = true
	

# Shows/hides Main Menu (Does not touch the background or title though)
func mainMenuShow():
	$QuitButton.show()
	$KeybindsButton.show()
	$StartButton.show()

func mainMenuHide():
	$QuitButton.hide()
	$KeybindsButton.hide()
	$StartButton.hide()

# Buttons
# When the user presses start button hide all the unnecessary ui 
func _on_start_button_pressed():
	mainMenuHide()
	$TextureRect.hide()
	$Title.hide()
	start = true

# Quit game
func _on_quit_button_pressed():
	get_tree().quit() # Closes the game

# Shows keybinds
func _on_keybinds_button_pressed():
	mainMenuHide()
	$KeybindsLabel.show()
	$BackButton.show()

func _on_back_button_pressed():
	$BackButton.hide()
	$KeybindsLabel.hide()
	$Title.show()
	mainMenuShow()
	
	
