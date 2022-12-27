



extends Node




#Exportar variavel de quando player morre acabar de contar, acho que isso tem que tar no World
var morreuUmAbobado

#Constants for the length of the countdown timer and turn timer

var COUNTDOWN_TIME = 5
var TURN_TIME = 8 

# Signals that will be emitted when the countdown timer and turn timer finish
signal countdown_finished
signal turn_finished

var jogadas1 = []
var jogadas2 = []

# A boolean flag that indicates whether it is currently players turn
var player_turn = true

# A Timer node that will be used to implement the countdown and turn timers
var timer

func _ready():

	pass


func start_turn():
	COUNTDOWN_TIME = 5
	TURN_TIME = 8 
	timer = Timer.new()
	add_child(timer)

	
	# Connect the timer's "timeout" signal to the appropriate function
	timer.connect("timeout", self, "_on_timer_timeout")
	
	timer.wait_time = COUNTDOWN_TIME
	timer.start()

func _on_timer_timeout():
	if timer.wait_time == COUNTDOWN_TIME:
		# Countdown timer has finished, so start the turn timer
		#timer.wait_time = TURN_TIME

		emit_signal("countdown_finished")
		#timer.start()
		
	else:
		emit_signal("turn_finished")

func _on_Controller_countdown_finished():
	timer.wait_tome = TURN_TIME
	timer.start()
	#FUNCAO PARA MOSTRAR OS BOTÕES E CRIAR O ARRAY DO PLAYER 
	


func _on_Player1_attack():
	jogadas1.push_back(1)


func _on_Player1_defend():
	jogadas1.push_back(2)


func _on_Player1_move_left():
	jogadas1.push_back(3)


func _on_Player1_move_right():
	jogadas1.push_back(4)


func _on_Player2_attack():
	jogadas2.push_back(1)


func _on_Player2_defend():
	jogadas2.push_back(2)


func _on_Player2_move_left():
	jogadas2.push_back(3)


func _on_Player2_move_right():
	jogadas2.push_back(4)
