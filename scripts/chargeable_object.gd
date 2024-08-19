extends Area2D
class_name ChargeableObject

var Interacted: bool = false

@export_group("SFX")
@export var sfxStreamer: AudioStreamPlayer2D
@export var sfxBreaking: AudioStreamMP3

func _on_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var _hippo = body as Hippo
		if _hippo.isCharging and Interacted == false:
			Interacted = true

			ChargeInteract()

func ChargeInteract() -> void:
	print("Interacted with charging Hippo")
	self.queue_free()
