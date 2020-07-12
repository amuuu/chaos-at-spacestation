extends Node2D

signal permit_computer3_interaction
signal unpermit_computer3_interaction

func _on_Area2D_body_entered(body):
	$Area2D/Label.visible = true
	emit_signal("permit_computer3_interaction")


func _on_Area2D_body_exited(body):
	$Area2D/Label.visible = false
	emit_signal("unpermit_computer3_interaction")
