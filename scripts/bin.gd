extends NPC

@onready var binSprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	connect("RequiredItemGiven", update_bin)

func update_bin() -> void:
	binSprite.play("empty")