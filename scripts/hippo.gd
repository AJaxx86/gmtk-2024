extends CharacterBody2D
class_name Hippo

@export var speed: float = 400.0

@export var maxWetness: float = 100.0


@export_group("Nodes")
@export var chargeTimer: Timer

var currentWetness: float = 0.0
var direction: Vector2 = Vector2.ZERO

#Saves last direction the Hippo faced, useful for animations and for the charge ability
var lastDirection = Vector2.ZERO

#Charge Attack
var isCharging: bool = false
var canCharge: bool = true
@export var chargeSpeed: float = 1000


func _ready() -> void:
	currentWetness = maxWetness

func _physics_process(delta: float) -> void:
	#checks last direction the Hippo faced, useful for animations and charge
	if direction != Vector2.ZERO:
		lastDirection = direction
	velocity = Vector2.ZERO
	
	#Charging Input
	if Input.is_action_just_pressed("Charge"):
		charge_ability()
	
	if isCharging == false:
		direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if isCharging:
		velocity = lastDirection * chargeSpeed * delta
	else:
		velocity = direction * speed  * delta
		
	
		
	move_and_collide(velocity)

func charge_ability() -> void:
	if canCharge:
		chargeTimer.start()
		isCharging = true
		canCharge = false
		
	else:
		push_warning("Attempted to charge during cooldown")


func _on_charge_timer_timeout() -> void:
	isCharging =false
	$ChargeCooldown.start()


func _on_charge_cooldown_timeout() -> void:
	canCharge =true
