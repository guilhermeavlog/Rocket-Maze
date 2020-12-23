extends Node2D

func change():
	get_tree().change_scene_to(load('res://Scenes/IngameScene.tscn'))
	queue_free()
	
	
func _process(_delta):
	if $menuMusic.playing != true:
		$menuMusic.play()
	if Input.is_action_pressed("ui_accept"):
		change()
