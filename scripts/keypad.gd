extends StaticBody2D
class_name Keypad

@export var codeTexture: Texture2D
@export var connectedDoor: Door
@export var working: bool = true

@export_category("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxButtonPress: AudioStreamMP3
@export var sfxCorrectCode: AudioStreamMP3
@export var sfxIncorrectCode: AudioStreamMP3

@onready var keypadUI: KeypadHUD = KeypadUI.get_node("pad")

var passcode: String = ""

func _ready() -> void:
			

	if connectedDoor:
		passcode = connectedDoor.requiredCode
		connectedDoor.keypadConnected = true

func activate() -> void:
	if working:
		if keypadUI.visible:
			keypadUI.hide()
			keypadUI.disconnect("CodeEntered", code_entered)
		else:
			if GlobalStuff.check_door_code(passcode) == true:
				keypadUI.popup(codeTexture)
			else:
				keypadUI.popup()
			keypadUI.connect("CodeEntered", code_entered)
	else:
		keypadUI.isBroken =true
		if keypadUI.visible:
			keypadUI.hide()
			keypadUI.disconnect("CodeEntered", code_entered)
		else:
			if GlobalStuff.check_door_code(passcode) == true:
				keypadUI.popup(codeTexture)
			else:
				keypadUI.popup()
			keypadUI.connect("CodeEntered", code_entered)

func code_entered(enteredCode: String) -> void:
	stream_sfx(sfxButtonPress)

	if enteredCode == passcode:
		print_debug("Correct code entered: " + str(enteredCode))
		stream_sfx(sfxCorrectCode)
		keypadUI.hide()
		keypadUI.disconnect("CodeEntered", code_entered)

		connectedDoor.force_open()
	else:
		push_warning("Incorrect code entered: " + str(enteredCode) + "\nRequired code: " + str(passcode))
		stream_sfx(sfxIncorrectCode)

func stream_sfx(soundFile: AudioStreamMP3) -> void:
	if sfxStreamer and soundFile != null:
		print_debug("Streaming sound: " + str(soundFile))
		sfxStreamer.stream = soundFile
		sfxStreamer.play()
	else:
		push_warning(str(self) + " has no sfx streamer or sfx file.")
