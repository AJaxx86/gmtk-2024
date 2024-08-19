extends CharacterBody2D
class_name Grub

signal CoughtGrub

@export var itemToGive: String = "grub"

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func catch() -> void:
	GlobalStuff.add_item(itemToGive)
	queue_free()
