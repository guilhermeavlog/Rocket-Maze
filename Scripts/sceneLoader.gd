extends Node

var prevBoxRotation = []
var count= 0

func sceneInstance(scenePreload, vector2, rotationObject):
	if scenePreload != null:
		var sceneInstance = scenePreload.instance()
		sceneInstance.position= vector2
		sceneInstance.rotation_degrees= rotationObject
		add_child(sceneInstance)
		count+=1
		if count>0:
			prevBoxRotation.append(rotationObject)
	

func _ready():
	var menupreload = load("res://Scenes/menu.tscn")
	sceneInstance(menupreload, Vector2(0,0), 0)
