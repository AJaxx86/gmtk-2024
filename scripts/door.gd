extends StaticBody2D
class_name Door

##Uses this to search GlobalStuff.doorCodes for a match before opening. If empty, the door opens freely.
@export var requiredCode: String

@export_group("Nodes")
@export var collision: CollisionShape2D
@export var doorSprites: Array[AnimatedSprite2D]

func force_open() -> void:
	collision.disabled = true
	play_animation("opened")

func force_close() -> void:
	collision.disabled = false
	play_animation("closed")

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
