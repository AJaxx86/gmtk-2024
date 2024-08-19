extends StaticBody2D
class_name SceneSwitch

@export_file var scenePath: String

func change_scene() -> void:
	save_positions()
	get_tree().change_scene_to_file(scenePath)

func save_positions() -> void:
	var player = get_tree().get_first_node_in_group("Player")
	var camera = get_tree().get_first_node_in_group("Cameras")
	if player is Hippo:
		GlobalStuff.hippoPosition = player.global_position
		GlobalStuff.hippoCharges = player.currentCharges
	if camera is StaticCamera2d:
		GlobalStuff.cameraPosition = camera.global_position
		GlobalStuff.cameraZoom = camera.zoom
