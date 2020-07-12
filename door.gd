extends Node2D

var state = 0 # 0 closed / 1 open

func _on_Area2D_body_entered(body):
	$Area2D/Sprite.play("open_door")
	state=2
	

func _on_Area2D_body_exited(body):
	$Area2D/Sprite.play("close_door")
	state=3

	
func _process(delta):
	if state==2 or state==1:
		if $Area2D/Sprite.animation=="open_door":
			$Area2D/Sprite.play("open")
			state=1
	if state==3 or state==0:
		if $Area2D/Sprite.animation=="close_door":
			$Area2D/Sprite.play("closed")
			state=0
