extends Area2D

@export var addItem: String

func _on_body_entered(body: Node2D) -> void:
	if body is Hippo:
		GlobalStuff.add_item(addItem)

		print_debug("event triggered, adding item: " + addItem)
		queue_free()
