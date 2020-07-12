extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		global.reset_game()
		get_tree().change_scene("res://root.tscn")
