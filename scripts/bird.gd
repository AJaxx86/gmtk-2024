extends CharacterBody2D
class_name Bird

@export var speed: float = 200.0
@export var jumpForce: float = 400.0
@export var boostJumpForce: float = 800.0

@export_group("Nodes")
@export var interactPrompt: RichTextLabel
@export var birdSprite: AnimatedSprite2D

@export_group("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxFootsteps: AudioStreamMP3
@export var sfxJump: AudioStreamMP3
@export var sfxCaw: AudioStreamMP3
@export var sfxCaw2: AudioStreamMP3
@export var sfxCaw3: AudioStreamMP3

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var birdCaws: Array = [sfxCaw, sfxCaw2, sfxCaw3]

var target: Node2D = null

var jumpBoostUsed: bool = false

func _ready() -> void:
	interactPrompt.hide()

func _physics_process(delta: float) -> void:
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x *= speed
	
	if velocity.x >= 1:
		birdSprite.flip_h = true
	elif velocity.x <= -1:
		birdSprite.flip_h = false

	if is_on_floor():
		jumpBoostUsed = false

		if velocity.x != 0:
			birdSprite.play("run")
			stream_sfx(sfxFootsteps)
		else:
			birdSprite.play("idle")

		if Input.is_action_just_pressed("jump"):
			birdSprite.play("jump")
			velocity.y = -jumpForce
			stream_sfx(sfxJump)
	else:
		if Input.is_action_just_pressed("jump") and jumpBoostUsed == false:
			velocity.y = -boostJumpForce
			birdSprite.play("doubleJump")
			jumpBoostUsed = true
			stream_sfx(sfxJump)

		velocity.y += gravity * delta

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		stream_sfx(birdCaws[randi() % birdCaws.size()])
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
		
		birdSprite.play("interact")

func interact_check(body: Node2D) -> void:
	if body.is_in_group("Interactable"):
		target = body
		interactPrompt.show()

func interact_check_exit(body: Node2D) -> void:
	target = null
	interactPrompt.hide()

var previousSFX: AudioStreamMP3
func stream_sfx(soundFile: AudioStreamMP3) -> void:
	if sfxStreamer:
		if soundFile != previousSFX:
			sfxStreamer.stream = soundFile
			previousSFX = soundFile
			sfxStreamer.play()
		else:
			if sfxStreamer.playing == false:
				sfxStreamer.play()
	
	else:
		push_error("This node doesn't have a SFX Streamer.")