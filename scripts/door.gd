extends StaticBody2D
class_name Door

@export var isLocked: bool = false

@export_group("Nodes")
@export var collision: CollisionShape2D

func open() -> void:
	if isLocked == false:
		collision.disabled = true

func close() -> void:
	if isLocked == false:
		collision.disabled = false