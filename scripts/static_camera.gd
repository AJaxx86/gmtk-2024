extends Camera2D
class_name StaticCamera2d
var targetPosition: Vector2 = Vector2.ZERO
@export var currentMarker: Marker2D
@export var transitionSpeed = 0.2

func _ready() -> void:
	add_to_group("Cameras")
	
	if GlobalStuff.cameraPosition != Vector2.ZERO:
		global_position = GlobalStuff.cameraPosition
		zoom = GlobalStuff.cameraZoom

func _process(delta: float) -> void:
	if targetPosition != Vector2.ZERO:
		global_position = lerp(global_position, targetPosition, delta * (1/transitionSpeed))

func move_position(newPos: Vector2, zoomLevel: float = 1.0) -> void:
	print_debug(str(newPos))
	targetPosition = newPos
	zoom = Vector2(zoomLevel, zoomLevel)
