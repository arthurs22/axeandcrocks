# Player script
#TODO:
#ATTACK AND DEFEND LOGGIC
#INTEGRATION WITH TURNS LOGIC (WORLD.GD) AND ACTION LOGIC (PLAYER.GD)
extends KinematicBody2D

# Enum to track the player's current action
enum PlayerAction {
	NONE,
	MOVE_RIGHT,
	MOVE_LEFT,
	ATTACK,
	DEFEND
}

# Variable to store the player's current action
var current_action = PlayerAction.NONE

# Speed at which the player moves
var move_speed = 250

# Strength of the player's attack
var attack_strength = 10

#Attack animation
onready var attack_animation = $attack
# Defense of the player
var defense = 5

# Function to handle input from the buttons
func button_input(button_name):
	# Set the current action based on the button pressed
	if _on_Button1_pressed() == "move_right":
		current_action = PlayerAction.MOVE_RIGHT
	elif _on_Button2_pressed() == "move_left":
		current_action = PlayerAction.MOVE_LEFT
	elif _on_Button3_pressed() == "attack":
		current_action = PlayerAction.ATTACK
	elif _on_Button4_pressed() == "defend":
		current_action = PlayerAction.DEFEND

# Function to execute the player's current action
func take_action():
	# Check the player's current action and perform the corresponding action
	if current_action == PlayerAction.MOVE_RIGHT:
		move_and_slide(Vector2(move_speed, 0))
	elif current_action == PlayerAction.MOVE_LEFT:
		move_and_slide(Vector2(-move_speed, 0))
	elif current_action == PlayerAction.ATTACK:
		# Attack logic goes here
		get_node("Sprite").play(attack_animation)
		
	elif current_action == PlayerAction.DEFEND:
		# Defense logic goes here
		pass
	
	# Reset the current action to NONE after taking the action
	current_action = PlayerAction.NONE

# Function to handle input from the keyboard
func _input(event):
	# Check for button press events
	if event is InputEventScreenTouch:
		if event.pressed:
			# Get the name of the button that was pressed
			button_name = event.get_node().name
			button_input(button_name)

# Function to update the player each frame
func _physics_process(delta):
	# Check if the player has a valid action selected
	if current_action != PlayerAction.NONE:
		take_action()

#MOVE RIGHT
func _on_Button1_pressed():
	handle_button_press("Button1")

#MOVE LEFT
func _on_Button2_pressed():
	handle_button_press("Button2")
	


#ATTACK
func _on_Button3_pressed():
	handle_button_press("Button3")

#DEFFEND
func _on_Button4_pressed():
	handle_button_press("Button4")
