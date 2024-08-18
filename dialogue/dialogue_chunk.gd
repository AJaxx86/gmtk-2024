extends Resource
class_name DialogueChunk

@export var speaker: String
@export var line: String

func _init() -> void:
    push_warning("new dialogue chunk created: ", speaker, " - ", line)
