extends Node2D

var timer = Timer.new()
var startingBox
var hall
var threeAlternativesBox
var twoAlternativesBox

var vectorBoxes= Vector2(0, 0)
export var cooldown = 0
var distBoxtoBox = -190
var count=1
var prevBox 
var prevRotation = sceneLoader.prevBoxRotation
var transformBox = Vector2(0, distBoxtoBox)
var rng = RandomNumberGenerator.new()
var correctPath= RandomNumberGenerator.new()
var i
var count = 0

func _ready():
	startingBox = load("res://Scenes/startingBox.tscn")
	hall = load("res://Scenes/hall.tscn")
	threeAlternativesBox = load("res://Scenes/3alternativesBox.tscn")
	twoAlternativesBox = load("res://Scenes/2alternativesBox.tscn")
	add_child(timer)
	timer.set_one_shot(true)
	timer.set_wait_time(cooldown)
	timer.connect("timeout", self, "cooldownFinished")
	timer.start()
	

func randBox():
	rng.randomize()
	var randBox = rng.randi_range(1,4)
	if randBox == 1:
		prevBox = hall
	if randBox == 2:
		prevBox = twoAlternativesBox
	if randBox == 3:
		prevBox = threeAlternativesBox
	
	


func nextBox():
	i = len(sceneLoader.prevBoxRotation)
	if count==0:
		sceneLoader.sceneInstance(startingBox, vectorBoxes,45)
		randBox()
		vectorBoxes+= transformBox.rotated(2*PI)
		sceneLoader.sceneInstance(prevBox, vectorBoxes,45)
		count+=1
	if prevBox == hall:
		vectorBoxes+= transformBox.rotated(deg2rad(prevRotation[i-1]))
		randBox()
		sceneLoader.sceneInstance(prevBox, vectorBoxes, prevRotation[i-1])	
	if prevBox == twoAlternativesBox:
		correctPath.randomize()
		var rightPath = correctPath.randi_range(1,3)
		randBox()
		if rightPath ==1:
			sceneLoader.sceneInstance(startingBox, vectorBoxes+Vector2(0, -distBoxtoBox).rotated(deg2rad(sceneLoader.prevBoxRotation[i-1]-90)), sceneLoader.prevBoxRotation[i-1]+90)
			vectorBoxes+=transformBox.rotated(deg2rad(sceneLoader.prevBoxRotation[i-1]+90))
			sceneLoader.sceneInstance(prevBox, vectorBoxes, sceneLoader.prevBoxRotation[i-2]+90)

		if rightPath ==2:
			sceneLoader.sceneInstance(startingBox, vectorBoxes+Vector2(0, -distBoxtoBox).rotated(deg2rad(sceneLoader.prevBoxRotation[i-1]+90)), sceneLoader.prevBoxRotation[i-1]-90)
			transformBox = Vector2(0, -distBoxtoBox).rotated(deg2rad(sceneLoader.prevBoxRotation[i-1]-90))
			sceneLoader.sceneInstance(prevBox, vectorBoxes+transformBox, sceneLoader.prevBoxRotation[i-1]+90)
#
	if prevBox == threeAlternativesBox:
		correctPath.randomize()
		var rightPath = correctPath.randi_range(1,3)
		if rightPath ==1:
			sceneLoader.sceneInstance(startingBox, vectorBoxes+ transformBox.rotated(deg2rad(prevRotation[i-1]-90)), prevRotation[i-1]+90)
			sceneLoader.sceneInstance(startingBox, vectorBoxes+ transformBox.rotated(deg2rad(prevRotation[i-1]+90)), prevRotation[i-1]-90)

		if rightPath ==2:
			sceneLoader.sceneInstance(startingBox, vectorBoxes+ transformBox.rotated(deg2rad(prevRotation[i-1]-90)), prevRotation[i-1]+90)
			sceneLoader.sceneInstance(startingBox, vectorBoxes+ transformBox.rotated(deg2rad(prevRotation[i-1]+90)), prevRotation[i-1]-90)
		if rightPath ==3:
			sceneLoader.sceneInstance(startingBox, vectorBoxes+ transformBox.rotated(deg2rad(prevRotation[i-1]-90)), prevRotation[i-1]+90)
			sceneLoader.sceneInstance(startingBox, vectorBoxes+ transformBox.rotated(deg2rad(prevRotation[i-1]+90)), prevRotation[i-1]-90)
			
func cooldownFinished():
	nextBox()
	timer.start()
	
		
		
	
