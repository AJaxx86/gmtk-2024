extends CharacterBody2D
class_name NPC

@export var greeting: String = "Gawd, I could really do with some grub. Danny told me one of the zoo keepers would have some in his office, but all he had was these symbols."
@export var taskAccomplished: String = "Lawdy lawd, you got some grub! Here, I'll trade you these symbols for that grub."
@export var requiredItem: String
@export var passcode: String
@export var messageDisplayTime: float = 4.0
@export_group("Nodes")
@export var message: RichTextLabel
@export var messageTimer: Timer

var isTaskComplete: bool = false

func _ready() -> void:
	hide_message()
	messageTimer.wait_time = messageDisplayTime

func show_message(text: String) -> void:
	message.text = text
	message.show()
	messageTimer.start()

func hide_message() -> void:
	message.hide()

func interact() -> void:
	if GlobalStuff.check_item(requiredItem) == true:
		show_message(taskAccomplished)
		if isTaskComplete == false:
			isTaskComplete = true
			GlobalStuff.add_item(passcode)
	else:
		show_message(greeting)
