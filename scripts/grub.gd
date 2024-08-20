extends CharacterBody2D
class_name Grub

signal CoughtGrub

@export var itemToGive: String = "grub"
@export var dialogues: Array[DialogueChunk]

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func catch() -> void:
	if dialogues.size() > 0:
		DialogueSystem.get_node("dialogue").start_dialogue(dialogues)
	
	GlobalStuff.add_item(itemToGive)
	queue_free()
