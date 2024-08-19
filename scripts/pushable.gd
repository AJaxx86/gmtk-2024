extends CharacterBody2D
class_name Pushable

signal Moving(direction)
signal Stop

#@export var Top_Area: Area2D
#@export var Bottom_Area: Area2D
#@export var Left_Area: Area2D
#@export var Right_Area: Area2D

@export_group("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxPush: AudioStreamMP3

var isPushed : bool = false
var direction: Vector2 = Vector2.ZERO
@export var PushSpeed: float = 50
@export var Pushable: bool = true
@export var infinitePush: bool = false
var lastPosition: Vector2 =Vector2.ZERO
func _ready() -> void:
	lastPosition = position
func _physics_process(delta: float) -> void:
	var hasStopped: bool= true
	if position == lastPosition and infinitePush: 
		velocity = Vector2.ZERO
		Stop.emit()
		
	elif position != lastPosition:
		hasStopped = false
		
		
	lastPosition = position 
	
	if isPushed and not infinitePush:
		position += direction * delta * PushSpeed
		Moving.emit(direction)
		hasStopped = false
	elif isPushed and infinitePush:
		velocity = direction * PushSpeed* delta
		Moving.emit(direction)
	
	if hasStopped == true and not infinitePush:
		Stop.emit()
	
		
	move_and_collide(velocity)

	
	


func _on_top_body_entered(body: Node2D) -> void:
	
	Push(body, Vector2.DOWN)



func _on_down_body_entered(body: Node2D) -> void:
	
	Push(body, Vector2.UP)



func _on_left_body_entered(body: Node2D) -> void:
	
	Push(body, Vector2.RIGHT)


func _on_right_body_entered(body: Node2D) -> void:
	
	Push(body, Vector2.LEFT)
	


func Push(body: Node2D, _direction):
	if body is Hippo:
		var hippo = body as Hippo
		if hippo.canPush and Pushable:
			direction = _direction
			hippo.isPushing = true
			isPushed = true

			stream_sfx(sfxPush)

func _on_body_exited(body: Node2D) -> void:
	if body is Hippo:
		var hippo = body as Hippo
		isPushed = false
		direction = Vector2.ZERO
		hippo.isPushing = false
		
func stream_sfx(soundFile: AudioStreamMP3) -> void:
	if sfxStreamer:
		sfxStreamer.stream = soundFile
		sfxStreamer.play()
