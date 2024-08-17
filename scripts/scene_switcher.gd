extends StaticBody2D
class_name SceneSwitch

@export_file var scenePath: String

func change_scene() -> void:
	get_tree().change_scene_to_file(scenePath)
