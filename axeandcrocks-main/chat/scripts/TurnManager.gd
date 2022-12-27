#Responsabilidades: controlar o tempo do turno( pre turno e turno), receber o input do player numa array,
#resolver ação



extends Node

onready var controller = get_node("Controller")

func _ready():
	controller.call("start_turn")
	
#Funções de atacar/Defender 
