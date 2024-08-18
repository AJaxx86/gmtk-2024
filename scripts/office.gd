extends SceneSwitch

@export var officeSprite: AnimatedSprite2D

var interacted: bool = false
var unlocked: bool = false:
	set(value):
		unlocked = value
		if unlocked:
			ChargeInteract()

func _ready() -> void:
	unlocked = GlobalStuff.officeUnlocked

func _on_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var _hippo = body as Hippo
		if _hippo.isCharging and interacted == false:
			interacted = true
			GlobalStuff.officeUnlocked = true
			ChargeInteract()

func ChargeInteract() -> void:
	add_to_group("Interactable")
	officeSprite.play("brokenWindow")
