extends CharacterBody2D
class_name Grub

signal CoughtGrub

@export var speed: float = 10.0
##How far away the Grub will move.
@export var moveRadius: float = 50.0

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var lifespan: float
var targetPos: Vector2

func _ready() -> void:
	targetPos = global_position + Vector2(randf_range(-moveRadius, moveRadius), randf_range(-moveRadius, moveRadius))

func catch() -> void:
	GlobalStuff.add_item("grub")
	queue_free()
