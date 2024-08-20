extends Control

signal CodeEntered

@export_group("Nodes")
@export var codeLabel: Label
@export var codePaper: TextureRect
@export var isBroken: bool = false

var currentCode: String = ""

func _ready() -> void:
	hide()
	codeLabel.text = ""

func button_pressed(number: int) -> void:
	if currentCode.length() < 4:
		currentCode += str(number)
		codeLabel.text = currentCode


func popup(codeTexture: Texture2D = null) -> void:
	if not isBroken:
		$AnimatedSprite2D.play("Broken Keypad")
	else:
		$AnimatedSprite2D.play("Base Keypad")
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
