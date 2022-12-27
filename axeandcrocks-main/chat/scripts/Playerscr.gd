extends KinematicBody2D


signal move_right
signal move_left
signal attack
signal defend
# Enum to track the player's current action

enum PlayerAction {
	NONE,
	MOVE_RIGHT,
	MOVE_LEFT,
	ATTACK,
	DEFEND
}

var action

#MOVE RIGHT
func _on_Button1_pressed():
	action = "Move_Right"

#MOVE LEFT
func _on_Button2_pressed():
	action = "Move_left"

#ATTACK
func _on_Button3_pressed():
	action = "Attack"

#DEFFEND
func _on_Button4_pressed():
	action = "Defend"

# Function to handle input from the buttons
func button_input(action):
	# Set the current action based on the button pressed
	if _on_Button1_pressed() == "Move_Right":
		emit_signal("move_right")
	elif _on_Button2_pressed() == "Move_left":
		emit_signal("move_left")
	elif _on_Button3_pressed() == "Attack":
		emit_signal("attack")
	elif _on_Button4_pressed() == "Defend":
		emit_signal("defend")

# Function to execute the player's current action MUDAR ISSO PARA WORLD.GD
#func take_action():
#	# Check the player's current action and perform the corresponding action
#	if current_action == PlayerAction.MOVE_RIGHT:
#		move_and_slide(Vector2(move_speed, 0))
#	elif current_action == PlayerAction.MOVE_LEFT:
#		move_and_slide(Vector2(-move_speed, 0))
#	elif current_action == PlayerAction.ATTACK:
#		# Attack logic goes here
#		get_node("Sprite").play(attack_animation)
#
#	elif current_action == PlayerAction.DEFEND:
#		print("jogador arregou")
#
#	# Reset the current action to NONE after taking the action
#	current_action = PlayerAction.NONE

## Function to update the player each frame TER A CHAMADA DO TAKE ACTION NO WORLD
#func _physics_process(delta):
#	# Check if the player has a valid action selected
#	if current_action != PlayerAction.NONE:
#		take_action()




