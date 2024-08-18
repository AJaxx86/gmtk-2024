extends CharacterBody2D
class_name Bird

@export var speed: float = 200.0
@export var jumpForce: float = 400.0
@export var boostJumpForce: float = 800.0

@export_group("Nodes")
@export var interactPrompt: RichTextLabel

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var target: Node2D = null

var jumpBoostUsed: bool = false

func _ready() -> void:
	interactPrompt.hide()

func _physics_process(delta: float) -> void:
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x *= speed
	
	if is_on_floor():
		jumpBoostUsed = false
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jumpForce
	else:
		if Input.is_action_just_pressed("jump") and jumpBoostUsed == false:
			velocity.y = -boostJumpForce
			jumpBoostUsed = true
		velocity.y += gravity * delta

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if target is NPC:
			target.interact()
		if target is SceneSwitch:
			target.change_scene()
		if target is Door:
			target.open()
		if target is Grub:
			target.catch()
		if target is DoorUnlockButton:
			target.unlock_door()

func interact_check(body: Node2D) -> void:
	if body.is_in_group("Interactable"):
		target = body
		interactPrompt.show()

func interact_check_exit(body: Node2D) -> void:
	target = null
	interactPrompt.hide()
