extends CharacterBody2D
class_name Bird

@export var speed: float = 200.0

@export_group("Nodes")
@export var interactPrompt: RichTextLabel

var target: Node2D = null

func _ready() -> void:
	interactPrompt.hide()

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

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
