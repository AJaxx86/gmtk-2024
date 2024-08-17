extends StaticBody2D
class_name DoorUnlockButton

##Uses the name of the door to search GlobalStuff.lockedDoorsArray and unlock the door.
@export var doorCode: String

func unlock_door() -> void:
	GlobalStuff.add_door_code(doorCode)
