extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5

func _ready():
	self.position= Vector2(0,0)
	
var velocity = Vector2()
var rotation_dir = 0
var positione

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		rotation_dir += 1
	if Input.is_action_pressed('ui_left'):
		rotation_dir -= 1
	velocity = Vector2(0, -speed).rotated(rotation)
		

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	positione= self.position

	
