extends Area2D

@export_group("Nodes")
@export var waterSprite: AnimatedSprite2D

func _ready() -> void:
	waterSprite.play()

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var hippo = body as Hippo
		hippo.getWet()
