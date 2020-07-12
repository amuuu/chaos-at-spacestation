extends Node2D


func _on_Area2D_body_entered(body):
	$Area2D/Label.visible = true


func _on_Area2D_body_exited(body):
	$Area2D/Label.visible = false
