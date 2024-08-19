extends CharacterBody2D
class_name Pushable

signal MoveDown
signal MoveUp
signal MoveLeft
signal MoveRight

#@export var Top_Area: Area2D
#@export var Bottom_Area: Area2D
#@export var Left_Area: Area2D
#@export var Right_Area: Area2D

var isPushed : bool = false
var direction: Vector2 = Vector2.ZERO
@export var PushSpeed: float = 50
@export var Pushable: bool = true
@export var infinitePush: bool = false
var lastPosition: Vector2 =Vector2.ZERO
func _ready() -> void:
	lastPosition = position
func _physics_process(delta: float) -> void:
	if position == lastPosition: 
		velocity = Vector2.ZERO
	lastPosition = position 
	
	if isPushed and not infinitePush:
		position += direction * delta * PushSpeed
	elif isPushed and infinitePush:
		velocity = direction * PushSpeed* delta
		
	move_and_collide(velocity)

	
	


func _on_top_body_entered(body: Node2D) -> void:
	
	Push(body, Vector2.DOWN)
	emit_signal("MoveDown")


func _on_down_body_entered(body: Node2D) -> void:
	
	Push(body, Vector2.UP)
	emit_signal("MoveUp")


func _on_left_body_entered(body: Node2D) -> void:
	
	Push(body, Vector2.RIGHT)
	emit_signal("MoveRight")

func _on_right_body_entered(body: Node2D) -> void:
	
	Push(body, Vector2.LEFT)
	
	emit_signal("MoveLeft")

func Push(body: Node2D, _direction):
	if body is Hippo:
		var hippo = body as Hippo
		if hippo.canPush and Pushable:
			direction = _direction
			hippo.isPushing = true
			isPushed = true

func _on_body_exited(body: Node2D) -> void:
	if body is Hippo:
		var hippo = body as Hippo
		isPushed = false
		direction = Vector2.ZERO
		hippo.isPushing = false
		$AnimatedSprite2D.flip_v =false
		$AnimatedSprite2D.flip_h =false
		
		$AnimatedSprite2D.play("idleNoBamboo")
