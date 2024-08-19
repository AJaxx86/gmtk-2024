extends ChargeableObject

@onready var officeSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var sceneSwitch: SceneSwitch = $SceneSwitch

var unlocked: bool = false:
	set(value):
		unlocked = value

		if value == true:
			officeSprite.play("broken_in" if unlocked else "locked")
			sceneSwitch.add_to_group("Interactable")

func _ready() -> void:
	unlocked = GlobalStuff.officeUnlocked

func ChargeInteract() -> void:
	unlocked = true
	GlobalStuff.officeUnlocked = true
