extends Node2D

func _on_addgrub_pressed() -> void:
	GlobalStuff.add_item("grub")

func _on_removegrub_pressed() -> void:
	GlobalStuff.remove_item("grub")
