extends AnimatableBody2D

func playAnimation(animation: String)->void:
	if animation != "" and animation != null:
		if animation == "backward":
			$AnimatedSprite2D.set_flip_h(true)
			$AnimatedSprite2D.play("forward")
		else:
			$AnimatedSprite2D.set_flip_h(false)
			$AnimatedSprite2D.play(animation)
