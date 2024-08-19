extends CharacterBody2D
class_name Hippo

@export_group("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxFootsteps: AudioStreamMP3
@export var sfxNoises: AudioStreamMP3

@export var speed: float = 400.0

### Direction
var direction: Vector2 = Vector2.ZERO

#Saves last direction the Hippo faced, useful for animations and for the charge ability
var lastDirection = Vector2.DOWN

###Pushing
var isPushing = false
var canPush = true

###Charge Attack
var isCharging: bool = false
var canCharge: bool = true
@export var chargeSpeed: float = 1000
@export var chargeLimit: int = 1
@export var chargeTimer: Timer

var currentCharges: int = 0

###Wetness
var isWet: bool = false

###Interact
var target: Node2D = null

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
			$AnimatedSprite2D.play("Idle_Up")
		elif lastDirection == Vector2.DOWN	:
			$AnimatedSprite2D.play("Idle_Down")
		elif lastDirection == Vector2.LEFT	:
			$AnimatedSprite2D.play("Idle_Left")
		elif lastDirection == Vector2.RIGHT	:
			$AnimatedSprite2D.play("Idle_Right")
	#Running animations
	elif direction != Vector2.ZERO and not isPushing:
		if direction == Vector2.UP:
			$AnimatedSprite2D.play("Run_Up")
		elif direction == Vector2.DOWN	:
			$AnimatedSprite2D.play("Run_Down")
		elif direction == Vector2.LEFT	:
			$AnimatedSprite2D.play("Run_Left")
		elif direction == Vector2.RIGHT	:
			$AnimatedSprite2D.play("Run_Right")
	
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
	if canCharge and currentCharges > 0:
		chargeTimer.start()
		isCharging = true
		canCharge = false
		currentCharges -= 1
		print_debug("Charges left: " + str(currentCharges))
		
	else:
		push_warning("Attempted to charge during cooldown")

func getWet():
	currentCharges = chargeLimit
	print_debug("Charges reset to " + str(currentCharges))

func _on_charge_timer_timeout() -> void:
	isCharging = false
	$ChargeCooldown.start()


func _on_charge_cooldown_timeout() -> void:
	canCharge =true


func _on_wet_timer_timeout() -> void:
	isWet = false

func _on_interact_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("Interactable"):
		target = body
		$interactPrompt.show()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and target != null:
		if target is NPC:
			target.interact()
		if target is SceneSwitch:
			target.change_scene()
		if target is Door:
			target.open()

func _on_interact_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("Interactable"):
		target = null
		$interactPrompt.hide()
