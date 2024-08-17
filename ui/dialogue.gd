extends Control
class_name Dialogue

@export_group("Nodes")
@export var dialogueBox: Control
@export var dialogueName: RichTextLabel
@export var dialogueText: RichTextLabel

var currentDialogues: Array[DialogueChunk] = []
var currentDialogueIndex: int = 0

func _ready() -> void:
	dialogueBox.hide()

func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pass

func start_dialogue(dialogueChunks: Array[DialogueChunk]) -> void:
	push_warning("initiated dialogues: %s" % dialogueChunks)

	currentDialogueIndex = 0
	currentDialogues = dialogueChunks
	dialogueBox.show()
	next_line()
	
	set_process(true)

func next_line() -> void:
	if currentDialogueIndex <= currentDialogues.size():
		dialogueName.text = currentDialogues[currentDialogueIndex].speaker
		dialogueText.text = currentDialogues[currentDialogueIndex].line

		push_warning("played dialogue chunk: %s" % currentDialogues[currentDialogueIndex])
		currentDialogueIndex += 1
	
	else:
		dialogueBox.hide()
		set_process(false)
