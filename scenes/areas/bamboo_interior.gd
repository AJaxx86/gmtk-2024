extends Node2D

func _ready() -> void:
	if GlobalStuff.enteredBamboo == false:
		GlobalStuff.enteredBamboo = true
