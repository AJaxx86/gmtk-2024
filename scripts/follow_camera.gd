extends Camera2D

@export var target: Node2D

func _physics_process(delta: float) -> void:
	if target:
		global_position = target.global_position
