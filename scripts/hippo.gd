extends CharacterBody2D
class_name Hippo

@export var speed: float = 400.0
@export_group("Nodes")
@export var chargeTimer: Timer


var direction: Vector2 = Vector2.ZERO

var isPushing=false

#Saves last direction the Hippo faced, useful for animations and for the charge ability
var lastDirection = Vector2.ZERO

#Charge Attack
var isCharging: bool = false
var canCharge: bool = true
@export var chargeSpeed: float = 1000

#Wetness
var isWet: bool = false
@export var wetDuration: float = 10.0



func _ready() -> void:
	pass

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
		
	animationSelector()
	
	move_and_collide(velocity)

func animationSelector():
	#Idle animations-
	if direction == Vector2.ZERO:
		if lastDirection == Vector2.UP:
			pass # Play Idle UP
		elif lastDirection == Vector2.DOWN	:
			pass # Play Idle Down
		elif lastDirection == Vector2.LEFT	:
			pass # Play Idle Left
		elif lastDirection == Vector2.RIGHT	:
			pass # Play Idle Right
	
	#Pushing Animations
	elif direction != Vector2.ZERO and isPushing:
		
		if direction == Vector2.UP:
			pass # Play pushing UP
		elif direction == Vector2.DOWN	:
			pass # Play pushing Down
		elif direction == Vector2.LEFT	:
			pass # Play pushing Left
		elif direction == Vector2.RIGHT	:
			pass # Play pushing Right
	
	if isCharging:
		if lastDirection == Vector2.UP:
			pass # Play Charging UP
		elif lastDirection == Vector2.DOWN	:
			pass # Play Charging Down
		elif lastDirection == Vector2.LEFT	:
			pass # Play Charging Left
		elif lastDirection == Vector2.RIGHT	:
			pass # Play Charging Right
	

func charge_ability() -> void:
	if canCharge:
		chargeTimer.start()
		isCharging = true
		canCharge = false
		
	else:
		push_warning("Attempted to charge during cooldown")

func getWet():
	isWet = true
	$WetTimer.start()

func _on_charge_timer_timeout() -> void:
	isCharging =false
	$ChargeCooldown.start()


func _on_charge_cooldown_timeout() -> void:
	canCharge =true


func _on_wet_timer_timeout() -> void:
	isWet = false
