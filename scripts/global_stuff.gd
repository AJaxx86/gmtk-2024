extends Node
class_name Globals

var items: Array[String] = []
var hippoPosition: Vector2 #update this before switching to bird scenes

func add_item(item: String) -> void:
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