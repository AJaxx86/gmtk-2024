extends StaticBody2D
class_name Door

##Uses this to search GlobalStuff.doorCodes for a match before opening. If empty, the door opens freely.
@export var requiredCode: String

@export var isHorizontal : bool = false

@export_group("Nodes")
@export var collision: CollisionShape2D
@export var doorSprites: Array[AnimatedSprite2D]

@export_group("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxDoorOpening: AudioStreamMP3

var keypadConnected: bool = false

func force_open() -> void:
	collision.disabled = true
	if isHorizontal:
		play_animation("opened_horizontal")
	else:
		play_animation("opened_vertical")
	stream_sfx(sfxDoorOpening)

func force_close() -> void:
	collision.disabled = false
	if isHorizontal:
		play_animation("closed_vertical")
	else:
		play_animation("closed_horizontal")
	stream_sfx(sfxDoorOpening)

func open() -> void:
	if requiredCode != "":
		if GlobalStuff.check_door_code(requiredCode) != true or keypadConnected == true:
			push_warning("Required code not found in inventory")
			return

	collision.disabled = true
	if isHorizontal:
		play_animation("opened_horizontal")
	else:
		play_animation("opened_vertical")
	stream_sfx(sfxDoorOpening)

func close() -> void:
	if requiredCode != "":
		if GlobalStuff.check_door_code(requiredCode) != true:
			push_warning("Required code not found in inventory")
			return

	collision.disabled = false
	play_animation("closed")
	stream_sfx(sfxDoorOpening)

func play_animation(animation: String) -> void:
	for door in doorSprites:
		door.play(animation)

func stream_sfx(soundFile: AudioStreamMP3) -> void:
	if sfxStreamer:
		sfxStreamer.stream = soundFile
		sfxStreamer.play()
