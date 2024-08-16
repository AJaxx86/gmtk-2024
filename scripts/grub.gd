extends CharacterBody2D
class_name Grub

func catch() -> void:
    GlobalStuff.add_item("grub")
    queue_free()