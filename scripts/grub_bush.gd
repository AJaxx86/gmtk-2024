extends Node2D

##Time in seconds between grub spawns. Grubs are spawned randomly in any grub spawners in the Grub_Spawners group.
@export_range(0.0, 10.0) var grubSpawnRate: float = 3.0

@export_group("Nodes")
@export var grubSpawnTimer: Timer

var grubSpawners: Array[Node2D] = []
var grubScene: PackedScene = preload("res://scenes/grub.tscn")

func _ready() -> void:
	for spawner in get_tree().get_nodes_in_group("Grub_Spawners"):
		grubSpawners.append(spawner)

func spawn_grub() -> void:
	var newGrub: Grub = grubScene.instantiate()

	newGrub.global_position = grubSpawners[randi() % grubSpawners.size()].global_position
	newGrub.global_position += Vector2(randf_range(-10, 10), randf_range(-10, 10))

	add_child(newGrub)