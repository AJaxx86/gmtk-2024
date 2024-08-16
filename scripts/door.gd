extends Node2D
class_name Door

#TODO: check for correct code from the keypad, open if correct
#if no keypad, door opens and closes freely

@export var isOpen: bool = false
@export var keypad: Node2D

func _ready() -> void:
	pass

func interact() -> void:
	if keypad == null:
		if isOpen == false:
			isOpen = true
		else:
			isOpen = false
	else:
		if keypad.check_code() == true:
			if isOpen == false:
				isOpen = true
			else:
				isOpen = false