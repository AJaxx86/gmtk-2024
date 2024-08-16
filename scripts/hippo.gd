extends CharacterBody2D
class_name Hippo

@export var speed: float = 400.0

@export var maxWetness: float = 100.0
@export var chargeDistance: float = 50.0

@export_group("Nodes")
@export var chargeTimer: Timer

var currentWetness: float = 0.0
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	currentWetness = maxWetness

func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction:
		velocity = direction * speed  * delta
		move_and_collide(velocity)
	

func charge_ability() -> void:
	if chargeTimer.is_stopped():
		chargeTimer.start()
	else:
		push_warning("Attempted to charge during cooldown")
