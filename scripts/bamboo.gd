extends Area2D

##Changes the bamboo texture.
@export var bambooVariant: Texture2D

@export_group("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxBreaking: AudioStreamMP3

func _ready() -> void:
	if bambooVariant:
		$Sprite2D.texture = bambooVariant

func _on_body_entered(body: Node2D) -> void:
	if body is Panda:
		if body.isRolling: #check this
			pass

func stream_sfx(soundFile: AudioStreamMP3) -> void:
	if sfxStreamer:
		sfxStreamer.stream = soundFile
		sfxStreamer.play()