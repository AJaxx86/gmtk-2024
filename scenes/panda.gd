extends Pushable
class_name Panda

@onready var pandaSprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	pass





func _on_stop() -> void:
	pandaSprite.play("idleNoBamboo")


func _on_moving(direction: Vector2) -> void:
	if direction == Vector2.UP:
		pandaSprite.play("rollVertical")
	elif direction == Vector2.DOWN:
		pandaSprite.play_backwards("rollVertical")
	elif direction == Vector2.LEFT:
		pandaSprite.play("rollHorizontal")
	elif direction == Vector2.RIGHT:
		pandaSprite.play_backwards("rollHorizontal")
