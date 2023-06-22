class_name Interactable extends Area2D

@export var oneshot = false
@export var interact_label = "none"
@export var interact_type = "none"
@export var interact_value = "none"
@export var teleport = false
@export var teleport_coordinates: Vector2 = Vector2(0, 0)
@export var target_path: Node
@export var function: String
@export var arguments: Array
