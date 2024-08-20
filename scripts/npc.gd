extends CharacterBody2D
class_name NPC

signal RequiredItemGiven

@export var greetingDialogue: Array[DialogueChunk]
@export var completedQuestDialogue: Array[DialogueChunk]
@export var requiredItem: String
@export var passcode: String

@export_group("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxNoises: AudioStreamMP3

func interact() -> void:
	if GlobalStuff.check_item(requiredItem) == true or requiredItem == "":
		push_warning(requiredItem + " found in inventory, playing dialogue: " + str(completedQuestDialogue))
		emit_signal("RequiredItemGiven")

		if requiredItem != "":
			GlobalStuff.remove_item(requiredItem)
		GlobalStuff.add_door_code(passcode)
		
		DialogueSystem.get_node("dialogue").start_dialogue(completedQuestDialogue)

	else:
		push_warning(requiredItem + " not found in inventory, playing dialogue: " + str(greetingDialogue))
		DialogueSystem.get_node("dialogue").start_dialogue(greetingDialogue)

var previousSFX: AudioStreamMP3
func stream_sfx(soundFile: AudioStreamMP3) -> void:
	if sfxStreamer:
		if soundFile != previousSFX:
			sfxStreamer.stream = soundFile
			previousSFX = soundFile
			sfxStreamer.play()
		else:
			if sfxStreamer.playing == false:
				sfxStreamer.play()
	
	else:
		push_error("This node doesn't have a SFX Streamer.")