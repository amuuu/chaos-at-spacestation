extends Node2D

signal lights_out
signal gravity_out
signal lights_on
signal gravity_on

var GAMETIME = int(global.time_left)


var rng = RandomNumberGenerator.new()
var last_light_occurence = 0
var last_gravity_occurence = 0



func _ready():
	$Timer.start(GAMETIME)
	$UI/TimeValue.text = String(int(GAMETIME/60))+"m"
	rng.randomize()


func _on_Timer_timeout():
	get_tree().change_scene("res://lost.tscn")
	pass

func _process(delta):
	
	$UI/TimeValue.text = String(int($Timer.time_left))+" seconds"
	global.time_left = $Timer.time_left
	
	if global.lights_fixed:
		$WorldEnvironment.environment.adjustment_brightness=0.67
		$UI/Lightsout.visible=false
		$UI/light_fixed.visible = true
		
	
	if int($Timer.time_left)%7==0:
		if not global.lights_fixed:
			var random_num = rng.randi_range(1, 2000)
			if random_num%119==0:
				emit_signal("lights_out")
				last_light_occurence = $Timer.time_left
	
	elif int($Timer.time_left)%8==0:
		var random_num = rng.randi_range(1, 2000)
		if random_num%123==0:
			emit_signal("gravity_out")
			last_gravity_occurence = $Timer.time_left
			$UI/Gravityout.visible=true
			
	
	elif last_light_occurence-$Timer.time_left>5:
		emit_signal("lights_on")
		last_light_occurence=0
	elif last_gravity_occurence-$Timer.time_left>5:
		emit_signal("gravity_on")
		last_gravity_occurence=0
		$UI/Gravityout.visible=false
		
		

func _on_root_lights_out():
	$lights.visible = false
	$WorldEnvironment.environment.adjustment_brightness=0.2
	$UI/Lightsout.visible=true


func _on_root_lights_on():
	$lights.visible = true
	$WorldEnvironment.environment.adjustment_brightness=0.67
	$UI/Lightsout.visible=false
	$KinematicBody2D/Light2D.texture_scale=0
	
