extends Area2D

@export var connectedDoor: Door

func _ready() -> void:
	if connectedDoor:
		connectedDoor.remove_from_group("Interactable")

func _on_body_entered(body: Node2D) -> void:
	if body is Pushable or Hippo:
		connectedDoor.force_open()

func _on_body_exited(body: Node2D) -> void:
	connectedDoor.force_close()
