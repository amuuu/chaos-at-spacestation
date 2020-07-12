extends Node2D

signal permit_computer2_interaction
signal unpermit_computer2_interaction


func _ready():
	pass


func _on_Area2D_body_entered(body):
	$Area2D/Label.visible = true
	emit_signal("permit_computer2_interaction")
	



func _on_Area2D_body_exited(body):
	$Area2D/Label.visible = false
	emit_signal("unpermit_computer2_interaction")
