class_name Player
extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_velocity: float = -350.0
@export var wall_boost: float = -50.0
@export var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity") #Standartmäßig: 980
@export var start_fall_dmg: int = 800
@export var end_fall_dmg: int = 2400
@export var damage_reduction: float = 0.0
@export var start_live: float = 100.0
@export var start_attempts: int = 5

@onready var all_interactions = []
@onready var interaction_text = $"Interaction Components/Interaction Text"

var can_jump: bool = true
var can_double_jump: bool = true
var current_fall_dmg: float = 0
var walljump: bool = false
var hold: int = 0 #For Reset
var can_move = true
var live = start_live
var attempts = start_attempts

var grip: float = 1.0
var jump_boost: float = 1.0
var velocity_boost: float = 1.0
var max_fall_speed: float = 100
var limit_fall_speed: bool = false

func _physics_process(delta):
	if not is_on_floor():
		if (velocity.y) < max_fall_speed and limit_fall_speed:
			velocity.y += gravity * delta
		elif not limit_fall_speed:
			velocity.y += gravity * delta

		if velocity.y > start_fall_dmg:
			current_fall_dmg = (velocity.y - start_fall_dmg) / (end_fall_dmg - start_fall_dmg)
	else:
		walljump = false
		if current_fall_dmg > 0:
			get_damage("Fall_Damage", current_fall_dmg * 100)
	
	if can_move:
		
		if Input.is_action_just_pressed("Interact"):
			execute_interaction()
		
		if Input.is_action_pressed("Reset"):
			hold += 1
			if hold >= 120:
				get_parent().ded("Reset")
				hold = 0
		else:
			hold = 0
	
		if Input.is_action_pressed("Jump"):
			if is_on_floor() and can_jump:
				velocity.y = jump_velocity
			elif is_on_wall_only() and can_double_jump and not walljump:
				velocity.y = jump_velocity + wall_boost
				walljump = true
		
	var direction = Input.get_axis("Move_L", "Move_R")
	if direction and can_move:
		velocity.x = direction * speed	#move_toward(velocity.x, direction * speed, pow(velocity.x, 2) + 1)
	else:
		velocity.x = move_toward(velocity.x, 0, speed/8 * grip)
	
	move_and_slide()

func get_damage(reason: String, damage: float)->void:
	live -= damage
	current_fall_dmg = 0
	print(live)
	
func respawn()->void:
	can_move = false
	current_fall_dmg = 0
	attempts -= 1
	if attempts <= 0:
		get_parent().lose()
		
	live = start_live
	velocity = Vector2(0, 0)
	print(live)

#Interaction Methoden

func _on_interaction_hitbox_area_entered(area):
	all_interactions.insert(0, area)
	update_interaction()
	

func _on_interaction_hitbox_area_exited(area):
	all_interactions.erase(area)
	update_interaction()

func update_interaction():
	if all_interactions:
		interaction_text.text = all_interactions[0].interact_label
	else:
		interaction_text.text = ""

func execute_interaction():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		match cur_interaction.interact_type:
			"print_text" : print(cur_interaction.interact_value)
			#"hurensohn" : get_parent().ded("ur mom")
			"action_sound" : pass
			
		if cur_interaction.teleport:
			#maybe some übergang shit oder sowas
			global_position = cur_interaction.teleport_coordinates
			
		if not cur_interaction.target_path == null and not cur_interaction.function.is_empty():
				var call_function = Callable(cur_interaction.target_path, cur_interaction.function) 
				call_function.callv(cur_interaction.arguments)
				
		if cur_interaction.oneshot:
			cur_interaction.queue_free()
