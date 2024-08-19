extends Control

@export var visibleInSeconds: float = 2.0

@export_group("Nodes")
@export var chargeBar: TextureProgressBar
@export var visibleTimer: Timer

func _ready() -> void:
	visibleTimer.wait_time = visibleInSeconds
	update_charges(0)

func update_charges(progress: int) -> void:
	show()
	chargeBar.value = progress
	visibleTimer.start()

func hide_ui() -> void:
	hide()
