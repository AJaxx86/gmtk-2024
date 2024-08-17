extends Node
class_name Globals

var itemLimit: int = 1
var items: Array[String] = []
var doorCodes: Array[String] = []
var hippoPosition: Vector2 #update this before switching to bird scenes

var lockedDoorsArray: Array = []

#ITEMS
func add_item(item: String) -> void:
	if items.size() > itemLimit:
		items.append(item)
		push_warning("item added to inventory: %s" % item)

func remove_item(item: String) -> void:
	items.erase(item)
	push_warning("item removed from inventory: %s" % item)

func check_item(item: String) -> bool:
	if item in items:
		push_warning("item found in inventory: %s" % item)
		return true
	else:
		push_warning("item not found in inventory: %s" % item)
		return false

#DOORS
func add_door_code(code: String) -> void:
	if code not in doorCodes:
		doorCodes.append(code)
		push_warning("door code added to inventory: %s" % code)

func check_door_code(code: String) -> bool:
	if code in doorCodes:
		push_warning("door code found: %s" % code)
		return true
	else:
		push_warning("door code not found: %s" % code)
		return false