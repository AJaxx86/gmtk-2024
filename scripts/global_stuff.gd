extends Node
class_name Globals

var itemLimit: int = 99
var items: Array[String] = []
var doorCodes: Array[String] = []

var hippoPosition: Vector2
var hippoCharges: int

var cameraPosition: Vector2
var cameraZoom: Vector2

var lockedDoorsArray: Array = []
var officeUnlocked: bool = false

var brokenObjects: Array = []

#ITEMS
func add_item(item: String) -> void:
	if items.size() < itemLimit:
		items.append(item)
		print_debug("item added to inventory: %s" % item)

func remove_item(item: String) -> void:
	items.erase(item)
	print_debug("item removed from inventory: %s" % item)

func check_item(item: String) -> bool:
	if item in items:
		print_debug("item found in inventory: %s" % item)
		return true
	else:
		push_warning("item not found in inventory: %s" % item)
		return false

#DOORS
func add_door_code(code: String) -> void:
	if code not in doorCodes:
		doorCodes.append(code)
		print_debug("door code added to inventory: %s" % code)

func check_door_code(code: String) -> bool:
	if code in doorCodes:
		print_debug("door code found: %s" % code)
		return true
	else:
		push_warning("door code not found: %s" % code)
		return false

#OBJECTS
func count_objects(objects: Array) -> void:
	pass