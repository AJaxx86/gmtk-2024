extends CharacterBody2D
class_name NPC

@export var myName: String = ""
@export var greetingDialogue: Array[DialogueChunk]
@export var completedQuestDialogue: Array[DialogueChunk]
@export var requiredItem: String
@export var passcode: String

func _ready() -> void:
	pass

func interact() -> void:
	if GlobalStuff.check_item(requiredItem) == true:
		GlobalStuff.remove_item(requiredItem)
		GlobalStuff.add_item(passcode)
		DialogueSystem.start_dialogue(completedQuestDialogue)
	else:
		DialogueSystem.start_dialogue(greetingDialogue)
