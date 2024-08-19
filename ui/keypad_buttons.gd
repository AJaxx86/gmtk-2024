extends Control

signal CodeEntered

@export_group("Nodes")
@export var codeLabel: Label
@export var codePaper: TextureRect

var currentCode: String = ""

func _ready() -> void:
	hide()
	codeLabel.text = ""

func popup(codeTexture: Texture2D = null) -> void:
	show()
	print_debug(str(codeTexture))
	if codeTexture:
		codePaper.texture = codeTexture
		codePaper.show()
	else:
		codePaper.hide()

func button_pressed(number: int) -> void:
	currentCode += str(number)
	codeLabel.text = currentCode

	if currentCode.length() == 4:
		emit_signal("CodeEntered", currentCode)
		currentCode = ""
		codeLabel.text = ""
