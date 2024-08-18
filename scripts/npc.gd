extends CharacterBody2D
class_name NPC

@export var greetingDialogue: Array[DialogueChunk]
@export var completedQuestDialogue: Array[DialogueChunk]
@export var requiredItem: String
@export var passcode: String

func _ready() -> void:
	pass

func interact() -> void:
	if GlobalStuff.check_item(requiredItem) == true:
		push_warning(requiredItem + " found in inventory, playing dialogue: " + str(completedQuestDialogue))

		GlobalStuff.remove_item(requiredItem)
		GlobalStuff.add_item(passcode)
		DialogueSystem.start_dialogue(completedQuestDialogue)

	else:
		push_warning(requiredItem + " not found in inventory, playing dialogue: " + str(greetingDialogue))
		DialogueSystem.start_dialogue(greetingDialogue)
