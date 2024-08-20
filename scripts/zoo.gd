extends Node2D
class_name Zoo

@export var prologueDialogue: Array[DialogueChunk]

func _ready() -> void:
	var player = get_tree().get_first_node_in_group("Player")
	if player is Hippo:
		player.global_position = GlobalStuff.hippoPosition
		player.currentCharges = GlobalStuff.hippoCharges
	
	if GlobalStuff.firstLoad == true:
		GlobalStuff.firstLoad = false
		DialogueSystem.get_node("dialogue").start_dialogue(prologueDialogue)
