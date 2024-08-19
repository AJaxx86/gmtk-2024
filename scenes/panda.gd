extends Pushable
class_name Panda

@onready var pandaSprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	connect("MoveUp", up_anim)
	connect("MoveDown", down_anim)
	connect("MoveLeft", left_anim)
	connect("MoveRight", right_anim)

func _process(delta: float) -> void:
	pass

func up_anim() -> void:
	pandaSprite.play("rollVertical")

func down_anim() -> void:
	pandaSprite.play_backwards("rollVertical")

func left_anim() -> void:
	pandaSprite.play("rollHorizontal")

func right_anim() -> void:
	pandaSprite.play_backwards("rollHorizontal")
