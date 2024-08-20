extends Label

@export var scrollSpeed: float = 50.0

func _process(delta: float) -> void:
	if global_position.y > 30:
		global_position.y -= scrollSpeed * delta
