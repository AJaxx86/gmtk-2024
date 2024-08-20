extends StaticBody2D
class_name PandaRock

@export var collision: CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalStuff.enteredBamboo == true:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func PandaInteract():
	$AudioStreamPlayer2D.play()
	hide()
	collision.queue_free()
	await $AudioStreamPlayer2D.finished

	queue_free()
	
