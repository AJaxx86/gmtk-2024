extends Control

signal CodeEntered

@export_group("Nodes")
@export var codeLabel: Label

var currentCode: String = ""

func _ready() -> void:
	hide()
	codeLabel.text = ""

func button_pressed(number: int) -> void:
	currentCode += str(number)
	codeLabel.text = currentCode

	if currentCode.length() == 4:
		emit_signal("CodeEntered", currentCode)
		currentCode = ""
		codeLabel.text = ""
