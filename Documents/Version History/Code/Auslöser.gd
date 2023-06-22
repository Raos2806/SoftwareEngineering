class_name Ausloeser
extends Area2D

var target: Node
var executed = true
@export var One_Shot: bool
@export var action_sound: AudioStream
@export var target_path: Node
@export var enter_function: String
@export var enter_arguments: Array
@export var exit_function: String
@export var exit_arguments: int
@export var enter: Dictionary
@export var exit: Dictionary

func _ready():
	if action_sound:
		$AudioStreamPlayer.stream = action_sound

func _on_body_entered(body):
		if body is Player:
			if target_path == null:
				target = body
			else:
				target = target_path
			
			if action_sound:
				$AudioStreamPlayer.play()
				
			if not enter.is_empty():
				for name in enter.keys():
					target.set(name, enter[name])
			if not enter_function.is_empty():
				var call_enter_function = Callable(target, enter_function) 
				call_enter_function.callv(enter_arguments)
				
			if One_Shot:
				executed = false

func _on_body_exited(body):
	if body is Player:
		if target_path == null:
			target = body
		else:
			target = target_path
		
		if not exit.is_empty():
			for name in exit.keys():
				target.set(name, exit[name])
		if not exit_function.is_empty():
			target.call(exit_function, exit_arguments)
			
		if One_Shot and not action_sound:
			queue_free()
