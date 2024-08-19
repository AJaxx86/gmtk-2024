extends Area2D

##Changes the bamboo texture.
@export var bambooVariant: Texture2D

func _ready() -> void:
	if bambooVariant:
		$Sprite2D.texture = bambooVariant

func _on_body_entered(body: Node2D) -> void:
	if body is Panda:
		if body.isRolling: #check this
			pass
