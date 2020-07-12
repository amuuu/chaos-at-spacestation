extends Node2D

signal load_root_scene

func _process(delta):
	if Input.is_action_just_pressed("quit_computer"):
		emit_signal("load_root_scene")


func _on_Node2D_load_root_scene():
	get_tree().change_scene("res://tmp1.tscn")
