extends CharacterBody2D
class_name Hippo

@export var speed: float = 100.0
@export var maxWetness: float = 100.0
@export var chargeDistance: float = 50.0

@export_group("Nodes")
@export var chargeTimer: Timer

var currentWetness: float = 0.0

func _ready() -> void:
	currentWetness = maxWetness

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction:
		velocity = direction * (speed * 100) * delta
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func charge_ability() -> void:
	if chargeTimer.is_stopped():
		chargeTimer.start()
	else:
		push_warning("Attempted to charge during cooldown")