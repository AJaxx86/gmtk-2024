extends Area2D

@export var camera: StaticCamera2d
@export var newPosition: Marker2D
@export var newZoom: float = 2.2

func _on_body_entered(body: Node2D) -> void:
	if newPosition != camera.currentMarker and body is Hippo:
		camera.currentMarker = newPosition
		print_debug("triggered")
		camera.move_position(newPosition.position, newZoom)
	
