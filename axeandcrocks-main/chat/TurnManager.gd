#Responsavel por receber as ações dos player, executar as ações( codigo vai ta no 

extends Node

onready var controller = get_node("Controller")

func _ready():
	controller.call("start_turn")
	

