extends NPC

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	connect("RequiredItemGiven", change_sprite)

func change_sprite() -> void:
	sprite.play("empty")