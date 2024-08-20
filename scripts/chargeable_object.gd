extends Area2D
class_name ChargeableObject

var Interacted: bool = false

@export_group("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxBreaking: AudioStream

func _ready() -> void:
	if GlobalStuff.brokenBarrels.has(self.name):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var _hippo = body as Hippo
		if _hippo.isCharging and Interacted == false:
			Interacted = true
			ChargeInteract()

func ChargeInteract() -> void:
	print("Interacted with charging Hippo")
	GlobalStuff.brokenBarrels.append(self.name)
	hide()
	$StaticBody2D.queue_free()
	stream_sfx(sfxBreaking)
	await $AudioStreamPlayer2D.finished
	self.queue_free()

var previousSFX: AudioStream
func stream_sfx(soundFile: AudioStream) -> void:
	if sfxStreamer:
		if soundFile != previousSFX:
			sfxStreamer.stream = soundFile
			sfxStreamer.play()
		else:
			if sfxStreamer.playing == false:
				sfxStreamer.play()
	
	else:
		push_error("This node doesn't have a SFX Streamer.")