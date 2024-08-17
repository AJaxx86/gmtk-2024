extends Area2D

@export var camera: Camera2D
@export var newPosition: Vector2
@export var newZoom: float = 2.2

func _on_body_entered(body: Node2D) -> void:
	print_debug("triggered")
	camera.move_position(newPosition, newZoom)
