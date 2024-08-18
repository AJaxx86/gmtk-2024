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
	pass

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		next_line()
	
 
func start_dialogue(dialogueChunks: Array[DialogueChunk]) -> void:
	push_warning("initiated dialogues: " + str(dialogueChunks))


	currentDialogueIndex = 0
	currentDialogues = dialogueChunks
	dialogueBox.show()
	next_line()
	
	toggle_player_control(false)
	set_process(true)

func next_line() -> void:
	if currentDialogueIndex < currentDialogues.size():
		dialogueName.text = currentDialogues[currentDialogueIndex].speaker
		dialogueText.text = currentDialogues[currentDialogueIndex].line

		print_debug("played dialogue chunk:\nSpeaker - " + str(currentDialogues[currentDialogueIndex].speaker) + "\nLine - " + str(currentDialogues[currentDialogueIndex].line))
		currentDialogueIndex += 1
	
	else:
		dialogueBox.hide()
		toggle_player_control(true)
		set_process(false)

func toggle_player_control(enabled: bool) -> void:
	var player = get_tree().get_first_node_in_group("Player")
	player.set_process(enabled)
	player.set_physics_process(enabled)
