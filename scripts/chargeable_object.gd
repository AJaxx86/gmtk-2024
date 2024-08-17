extends Area2D

var Interacted: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Hippo:
		var _hippo = body as Hippo
		if _hippo.isCharging and Interacted == false:
			Interacted =true
			ChargeInteract()

func ChargeInteract() -> void:
	print("Interacted with charging Hippo")
