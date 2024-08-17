extends Node2D

func move_camera() -> void:
	pass

func _on_enclosure_1_body_entered(body: Node2D, newCameraPos: Vector2) -> void:
	print_debug(str(newCameraPos))
