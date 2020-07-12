extends Node2D

signal load_root_scene3
signal win_scene

func _process(delta):
	if Input.is_action_just_pressed("quit_computer"):
		emit_signal("load_root_scene3")
	
	if $Button.pressed:
		var result = $Code.search("BIG_BUG", 2, 114, 0)
		if result.size() == 0:			
			global.won = true
		
		if !global.won:
			emit_signal("load_root_scene3")
		else:
			emit_signal("win_scene")
		

func _on_Node2D_load_root_scene3():
	get_tree().change_scene("res://tmp3.tscn")


func _on_Node2D_win_scene():
	get_tree().change_scene("res://won.tscn")
