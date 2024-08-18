extends CharacterBody2D
class_name Grub

signal CoughtGrub

@export var speed: float = 10.0
##How far away the Grub will move.
@export var moveRadius: float = 50.0

@export_group("Nodes")
@export var deathTimer: Timer

var lifespan: float
var targetPos: Vector2

func _ready() -> void:
	targetPos = global_position + Vector2(randf_range(-moveRadius, moveRadius), randf_range(-moveRadius, moveRadius))
	deathTimer.wait_time = lifespan
	deathTimer.start()

func _physics_process(delta: float) -> void:
	if global_position != targetPos:
		global_position = global_position.move_toward(targetPos, (speed * delta))
	else:
		targetPos = global_position + Vector2(randf_range(-moveRadius, moveRadius), randf_range(-moveRadius, moveRadius))

func catch() -> void:
	emit_signal("CoughtGrub")
	die()

func die() -> void:
	print_debug("grub died")
	queue_free()
