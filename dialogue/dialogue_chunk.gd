extends Resource
class_name DialogueChunk

@export var speaker: String
@export var line: String

func _init(speaker: String, line: String) -> void:
    speaker = speaker
    line = line

    push_warning("new dialogue chunk created: %s - %s" % [speaker, line])
