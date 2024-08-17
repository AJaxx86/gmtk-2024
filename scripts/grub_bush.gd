extends Node2D

##Time in seconds between grub spawns. Grubs are spawned randomly in any grub spawners in the Grub_Spawners group.
@export_range(0.0, 5.0, 0.1) var grubSpawnRate: float = 3.0
##Time in seconds the grub is alive for.
@export_range(0.0, 10.0, 0.1) var grubLifeSpan: float = 4.0
@export_range(0, 100, 1) var maxGrubs: int = 10

@export_group("Nodes")
@export var grubSpawnTimer: Timer

var grubSpawners: Array[Node2D] = []
var grubScene: PackedScene = preload("res://scenes/grub.tscn")

func _ready() -> void:
	grubSpawnTimer.wait_time = grubSpawnRate
	grubSpawnTimer.start()

	for spawner in get_tree().get_nodes_in_group("Grub_Spawners"):
		grubSpawners.append(spawner)

func spawn_grub() -> void:
	if get_tree().get_node_count_in_group("Grubs") < maxGrubs:
		var newGrub: Grub = grubScene.instantiate()

		newGrub.global_position = grubSpawners[randi() % grubSpawners.size()].global_position
		newGrub.global_position += Vector2(randf_range(-25, 25), randf_range(-25, 25))
		newGrub.lifespan = grubLifeSpan

		add_child(newGrub)
	else:
		push_warning("Grub limit reached.")
