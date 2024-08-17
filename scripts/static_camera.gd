extends Camera2D

var targetPosition: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	if targetPosition != Vector2.ZERO:
		global_position = lerp(global_position, targetPosition, delta)

func move_position(newPos: Vector2, zoomLevel: float = 1.5) -> void:
	print_debug(str(newPos))
	targetPosition = newPos
	zoom = Vector2(zoomLevel, zoomLevel)