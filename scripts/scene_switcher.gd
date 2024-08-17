extends StaticBody2D
class_name SceneSwitch

@export_file var scenePath: String

func change_scene() -> void:
	save_player_position()
	get_tree().change_scene_to_file(scenePath)

func save_player_position() -> void:
	var player = get_tree().get_first_node_in_group("Player")
	if player is Hippo:
		GlobalStuff.hippoPosition = player.global_position