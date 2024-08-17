extends StaticBody2D
class_name Door

@export var isLocked: bool = false

@export_group("Nodes")
@export var collision: CollisionShape2D
@export var doorSprite: AnimatedSprite2D

var state: String = "closed"

func _ready() -> void:
	pass

func open() -> void:
	if isLocked == false:
		collision.disabled = true
		doorSprite.play("opened")

func close() -> void:
	if isLocked == false:
		collision.disabled = false
		doorSprite.play("closed")
