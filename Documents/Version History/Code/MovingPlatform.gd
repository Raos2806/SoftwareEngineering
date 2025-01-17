extends Path2D
@onready var follow = $PathFollow2D

@export var autostart = false
@export var move_rate = 200
@export var ping_pong = false
@export var loop = true
@export var forward = true
@export var start_wait_time: float = 0.0
@export var end_wait_time: float = 0.0
@export var stop_time: float = 0.0
@export var wait_then_stop: float = 0.0
@export var slowdown = 1.0
@export var power = 12
@export var min_slowdown = 0.05
@export var start_progress_ratio: float = 0.0
@export var debug = false
@export var animation = false
@export var action_sound: AudioStream

var waiting = false
var start = false
var start_move = false
var audio = false

func _ready():
	follow.progress_ratio = start_progress_ratio
	$Platform.position = follow.position
	follow.loop = false
	
	if action_sound:
		$Audio.stream = action_sound
		audio = true
	
	if animation:
		$Platform.playAnimation("disabled")
	
	if autostart:
		start_platform()
	
func _physics_process(delta):
	
	if not waiting and start:
		slowdown = clamp((1 - pow((2 * follow.progress_ratio - 1), power)), min_slowdown, 1.0)
		if debug:
			print(follow.progress_ratio)
		if forward:
			follow.progress += move_rate * delta * slowdown
			if animation and not start_move:
				$Platform.playAnimation("forward")
				start_move = true
		else:
			follow.progress -= move_rate * delta * slowdown
			if animation and not start_move:
				$Platform.playAnimation("backward")
				start_move = true
		
		if ping_pong:
			if follow.progress_ratio >= 1.0:
				if animation and not ping_pong and not loop and forward:
					$Platform.playAnimation("disabled")
				elif animation:
					$Platform.playAnimation("default")

				if end_wait_time >= 0.1:
					waiting = true
					if audio:
						$Audio.stop()
					$End_Timer.start()
					
				forward = false
				
			if follow.progress_ratio <= 0.0:
				if animation and not ping_pong and not loop and not forward:
					$Platform.playAnimation("disabled")
				elif animation:
					$Platform.playAnimation("default")

				if start_wait_time >= 0.1:
					waiting = true
					if audio:
						$Audio.stop()
					$Start_Timer.start()

				forward = true
		elif loop:
			if follow.progress_ratio >= 1:
				if end_wait_time >= 0.1:
					waiting = true
					if audio:
						$Audio.stop()
					$End_Timer.start()
				else:
					follow.progress = 0
			
		get_child(-1).position = follow.position

func start_platform():
	if end_wait_time >= 0.1:
		$End_Timer.wait_time = end_wait_time
	
	if start_wait_time >= 0.1:
		waiting = true
		$Start_Timer.wait_time = start_wait_time
		$Start_Timer.start()
	elif audio:
		$Audio.play()
	
	if stop_time >= 0.1 and wait_then_stop >= 0.1:
		waiting = true
		$Wait_Timer.wait_time = stop_time
		$Wait_Then_Stop_Timer.wait_time = wait_then_stop
		$Wait_Timer.start()
	
	$Platform.playAnimation("default")
	start = true

#Start/End Stop_Timer
func _on_start_timer_timeout():
	waiting = false
	start_move = false
	if audio:
		$Audio.play()

func _on_end_timer_timeout():	
	start_move = false
		
	if loop:
		follow.progress = 0
		get_child(-1).position = follow.position
		if start_wait_time >= 0.1:
			$Start_Timer.start()
		else:
			waiting = false
			if audio:
				$Audio.play()
	else:
		waiting = false
		if audio:
			$Audio.play()

#Stop_Timer
func _on_wait_timer_timeout():
	if $Start_Timer.is_stopped() and $End_Timer.is_stopped():
		if animation:
			start_move = false
		waiting = false
		if audio:
			$Audio.play()
		$Wait_Then_Stop_Timer.start()
	else:
		$Wait_Timer.start()
	
func _on_wait_then_stop_timer_timeout():
	if animation:
		$Platform.playAnimation("default")
	if audio:
		$Audio.stop()
	waiting = true
	$Wait_Timer.start()
	
