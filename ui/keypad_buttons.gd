extends Control
class_name KeypadHUD

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
		$AudioStreamPlayer.play()
		currentCode += str(number)
		codeLabel.text = currentCode


func popup(codeTexture: Texture2D = null) -> void:
	if isBroken and GlobalStuff.check_item("keypad button") == false:
		$AnimatedSprite2D.play("Broken Keypad")
		$"AnimatedSprite2D/buttons/4".disabled = true
	elif isBroken and GlobalStuff.check_item("keypad button") == true:
		$AnimatedSprite2D.play("Last Keypad")
		$"AnimatedSprite2D/buttons/4".disabled = false
	else:
		$AnimatedSprite2D.play("Base Keypad")
		$"AnimatedSprite2D/buttons/4".disabled = false
	show()
	
	if codeTexture:
		codePaper.texture = codeTexture
		codePaper.show()
	else:
		codePaper.hide()


func _on_reset_pressed() -> void:
	$AudioStreamPlayer.play()
	currentCode = ""
	codeLabel.text =""


func _on_enter_pressed() -> void:
	emit_signal("CodeEntered", currentCode)
	currentCode = ""
	codeLabel.text = ""
