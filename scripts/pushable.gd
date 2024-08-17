extends CharacterBody2D

var isPushed : bool = false
var direction: Vector2 = Vector2.ZERO
@export var PushSpeed: float = 50
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if isPushed:
		position += direction * delta * PushSpeed
	


func _on_top_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var hippo = body as Hippo
		isPushed = true
		direction = Vector2.DOWN
		hippo.isPushing =true


func _on_down_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var hippo = body as Hippo
		isPushed = true
		direction = Vector2.UP
		hippo.isPushing =true


func _on_left_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var hippo = body as Hippo
		isPushed = true
		direction = Vector2.RIGHT
		hippo.isPushing =true


func _on_right_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var hippo = body as Hippo
		isPushed = true
		direction = Vector2.LEFT
		hippo.isPushing =true


func _on_body_exited(body: Node2D) -> void:
	if body is Hippo:
		var hippo = body as Hippo
		isPushed = false
		direction = Vector2.ZERO
		hippo.isPushing = false
