extends CharacterBody2D
class_name SceneSwitch

@export var scenePath: String

func change_scene() -> void:
	get_tree().change_scene_to_file(scenePath)