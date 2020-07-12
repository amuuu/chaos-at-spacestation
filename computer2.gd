extends Node2D

signal load_root_scene2

func _process(delta):
	if Input.is_action_just_pressed("quit_computer"):
		emit_signal("load_root_scene2")
	
	if $Button.pressed:
		var result = $Code.search("Our spacestation has a light bug!", 2, 11, 0)
		if result.size() == 0:			
			global.lights_fixed = true
		emit_signal("load_root_scene2")
		


func _on_Node2D_load_root_scene2():
	get_tree().change_scene("res://tmp2.tscn")
