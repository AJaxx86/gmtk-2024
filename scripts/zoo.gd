extends Node2D
class_name Zoo

func _ready() -> void:
	var player = get_tree().get_first_node_in_group("Player")
	if player is Hippo:
		player.global_position = GlobalStuff.hippoPosition