extends Node

# The amount of time in seconds that each turn should last
const TURN_DURATION = 5

# The amount of time in seconds to wait between turns
const TURN_COOLDOWN = 10

# The current player whose turn it is (1 or 2)
var current_player = 1

# The timer for managing the turn duration
var turn_timer

func _ready():
	# Initialize the timer
	turn_timer = Timer.new()
	turn_timer.wait_time = TURN_DURATION
	turn_timer.one_shot = true
	add_child(turn_timer)
	turn_timer.connect("timeout", self, "_end_turn")

func _end_turn():
	# End the current player's turn and start the next player's turn
	current_player = (current_player % 2) + 1
	turn_timer.start()

func _input_received(player, action):
	# A player has taken an action, so end their turn early
	if player == current_player:
		turn_timer.stop()
		_end_turn()

func _handle_exception():
	# TODO: Implement handling for when a player does not take an action during their turn
	pass
