extends RigidBody2D

@export var pushDistance: float = 10.0

func _ready() -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if body is Hippo:
		position = body.position + (body.position - position).normalized() * pushDistance
