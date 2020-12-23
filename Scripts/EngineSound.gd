extends AudioStreamPlayer2D

func _physics_process(_delta):
	if self.playing == false:
				self.play()
