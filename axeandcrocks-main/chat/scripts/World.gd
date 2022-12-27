extends Node

onready var controller = get_node("Controller")

func _ready():
	controller.call("start_turn")
	
#Manage Turn vai 
