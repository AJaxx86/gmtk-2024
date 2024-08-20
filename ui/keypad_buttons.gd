extends Control

signal CodeEntered

@export_group("Nodes")
@export var codeLabel: Label
@export var codePaper: TextureRect

var currentCode: String = ""

func _ready() -> void:
	hide()
	codeLabel.text = ""

func button_pressed(number: int) -> void:
	if currentCode.length() < 4:
		currentCode += str(number)
		codeLabel.text = currentCode


func popup(codeTexture: Texture2D = null) -> void:
	show()
	
	if codeTexture:
		codePaper.texture = codeTexture
		codePaper.show()
	else:
		codePaper.hide()


func _on_reset_pressed() -> void:
	currentCode = ""
	codeLabel.text =""


func _on_enter_pressed() -> void:
	emit_signal("CodeEntered", currentCode)
	currentCode = ""
	codeLabel.text = ""
