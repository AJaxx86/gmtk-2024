extends StaticBody2D
class_name Door

@export var requiredCode: String

@export_group("Nodes")
@export var collision: CollisionShape2D
@export var doorSprites: Array[AnimatedSprite2D]

var state: String = "closed"

func _ready() -> void:
	pass

func open() -> void:
	if requiredCode != "":
		if GlobalStuff.check_door_code(requiredCode) != true:
			push_warning("Required code not found in inventory")
			return

	collision.disabled = true
	play_animation("opened")

func close() -> void:
	if requiredCode != "":
		if GlobalStuff.check_door_code(requiredCode) != true:
			push_warning("Required code not found in inventory")
			return

	collision.disabled = false
	play_animation("closed")

func play_animation(animation: String) -> void:
	for door in doorSprites:
		door.play(animation)
