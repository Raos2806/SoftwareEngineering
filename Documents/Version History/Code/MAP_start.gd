extends Node2D

var current_spawnpoint: Vector2 = Vector2(0, 0)
var current_spawnindex: int = 0

func _ready():
	current_spawnpoint = $Player.position
	print(current_spawnpoint)

func checkpoint_reached(checkpoint: int)->void:
	if current_spawnindex < checkpoint:
		current_spawnindex = checkpoint
		current_spawnpoint = get_node("Checkpoint" + str(checkpoint)).position
		print(current_spawnpoint)

func start(object: String):
	if object == "1":
		pass
	elif object == "2":
		$Platform_Back.start_platform()
	elif object == "3":
		pass
	elif object == "4":
		pass
	elif object == "5":
		pass
	elif object == "6":
		pass
	elif object == "7":
		pass
	else:
		pass

func ded(reason: String):
	$Player.respawn()
	#da halt warten, bis kamera ankommt....ka, wie xD
	$Player.position = current_spawnpoint
	#$Player.velocity.y = -200 für respawn-animation
	print(reason)
	$Player.can_move = true

func lose():
	print("You Lose!")	#scene on top packen(sichtbar machen, wo dann ergebnis gelabeled wird...oder ne neue node machen, aber kp wie xD die muss ja on-top gerendert werden)

func win():
	print("You Win!")	#hier das gleiche, wie bei lose

func _process(delta):
	pass
