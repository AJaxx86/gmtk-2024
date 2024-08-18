extends CharacterBody2D
class_name NPC

signal RequiredItemGiven

@export var greetingDialogue: Array[DialogueChunk]
@export var completedQuestDialogue: Array[DialogueChunk]
@export var requiredItem: String
@export var passcode: String

func _ready() -> void:
	pass

func interact() -> void:
	if GlobalStuff.check_item(requiredItem) == true or passcode == "":
		push_warning(requiredItem + " found in inventory, playing dialogue: " + str(completedQuestDialogue))
		emit_signal("RequiredItemGiven")

		GlobalStuff.remove_item(requiredItem)
		GlobalStuff.add_item(passcode)
		DialogueSystem.get_node("dialogue").start_dialogue(completedQuestDialogue)

	else:
		push_warning(requiredItem + " not found in inventory, playing dialogue: " + str(greetingDialogue))
		DialogueSystem.get_node("dialogue").start_dialogue(greetingDialogue)
