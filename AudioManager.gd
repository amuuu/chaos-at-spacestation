extends Node2D


var drums_allowed = false

func _ready():
	$WithoutDrums.play()	
	

func _on_KinematicBody2D_computer1_interacted():
	drums_allowed = true


func _on_WithoutDrums_finished():
	if drums_allowed:
		$WithoutDrums.stop()
		$WithDrums.play()
	else:
		$WithoutDrums.play()


func _on_WithDrums_finished():
	$WithDrums.play()
