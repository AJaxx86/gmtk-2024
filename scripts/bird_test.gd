extends Node2D

func _on_addgrub_pressed() -> void:
	Inventory.add_item("grub")

func _on_removegrub_pressed() -> void:
	Inventory.remove_item("grub")
