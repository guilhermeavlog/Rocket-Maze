extends KinematicBody2D
var rocketPosition
var vel

func rocketPos():
	rocketPosition = get_parent().get_node("rocketMovement").get_position()
	
func _physics_process(_delta):
	rocketPos()
	vel= move_and_slide(rocketPosition)
