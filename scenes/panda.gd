extends Pushable
class_name Panda

@onready var pandaSprite: AnimatedSprite2D = $AnimatedSprite2D
var isRolling: bool
@export var RollingSpeed: float = 500

func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	pass


func Push(body: Node2D, _direction):
	if body is Hippo:
		var hippo = body as Hippo
		if hippo.canPush and Pushable:
			direction = _direction
			hippo.isPushing = true
			isPushed = true
			if hippo.isCharging:
				rolling()


func _on_stop() -> void:
	pandaSprite.play("idleNoBamboo")
	if rolling:
		velocity = Vector2.ZERO
		infinitePush = false
		isRolling = false
	


func _on_moving(direction: Vector2) -> void:
	if direction == Vector2.UP:
		pandaSprite.play("rollVertical")
	elif direction == Vector2.DOWN:
		pandaSprite.play_backwards("rollVertical")
	elif direction == Vector2.LEFT:
		pandaSprite.play("rollHorizontal")
	elif direction == Vector2.RIGHT:
		pandaSprite.play_backwards("rollHorizontal")

func rolling():
	infinitePush = true
	isRolling = true


func _on_rolling_collision_body_entered(body: Node2D) -> void:
	if rolling and body is PandaRock:
		Stop.emit()
		body.PandaInteract()
