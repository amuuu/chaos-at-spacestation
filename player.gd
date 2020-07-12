extends KinematicBody2D

signal rocket_launched
signal flashlight_increased
signal flashlight_decreased

var packed_scene
var packed_scene2

var velocity = Vector2(0,0)
const SPEED = 300
const BASE_GRAVITY = 30
const JUMPFORCE = -1000
const NOGRAVITY = -500
const ROCKETPOWER = 300

var side = 1
var gravity = BASE_GRAVITY
var gravity_out = false
var use = false
var pc_number = 0

func _ready():
	$Light2D.texture_scale = 0
	

func _physics_process(delta):
	$Sprite.flip_h = false
	$Sprite.play("idle")
	$Particles2D.emitting=false
	$Particles2D.position=Vector2(-15.62,8)
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("run")		
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.flip_h = true
		$Particles2D.position=Vector2(15.62,8)
		$Sprite.play("run")

	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		$Sprite.play("jetpack")

	if Input.is_action_pressed("gravity_test"):
		$Particles2D.emitting=true
		if  not gravity_out:
			velocity.y = -ROCKETPOWER*side
			$Particles2D.process_material.gravity=Vector3(0,100,0)
		else:
			velocity.y = ROCKETPOWER*side
			$Particles2D.process_material.gravity=Vector3(0,-100,0)
			
		$Sprite.play("jetpack")
		emit_signal("rocket_launched")
		
		
	velocity.y += gravity*side		
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)
	
	# handle flashlight
	if Input.is_action_pressed("increase_light"):
		$Light2D.texture_scale -= 0.015
		emit_signal("flashlight_increased")
	elif Input.is_action_pressed("decrease_light"):
		if $Light2D.texture_scale < 0:
			$Light2D.texture_scale += 0.015
			emit_signal("flashlight_decreased")
		
	
	if gravity_out:
		velocity.y = NOGRAVITY*side
		
		
	if Input.is_action_just_pressed("interaction") and use and pc_number!=0:
		use = false
		
#		ResourceSaver.save("res://tmp"+String(pc_number)+".tscn", packed_scene)
		if pc_number==1:
			packed_scene = PackedScene.new()
			packed_scene.pack(get_tree().get_current_scene())
			ResourceSaver.save("res://tmp1.tscn", packed_scene)
		if pc_number==2:
			packed_scene2 = PackedScene.new()
			packed_scene2.pack(get_tree().get_current_scene())
			ResourceSaver.save("res://tmp2.tscn", packed_scene2)
		if pc_number==3:
			packed_scene2 = PackedScene.new()
			packed_scene2.pack(get_tree().get_current_scene())
			ResourceSaver.save("res://tmp3.tscn", packed_scene2)
		get_tree().change_scene("res://computer"+String(pc_number)+".tscn")


func _on_root_gravity_out():
	gravity_out = true

func _on_root_gravity_on():
	gravity_out = false

func _on_laptop_permit_computer_interaction():
	pc_number = 1
	use = true

func _on_laptop_unpermit_computer_interaction():
	pc_number = 0
	use = false
	
func _on_laptop2_permit_computer2_interaction():
	pc_number = 2
	use = true

func _on_laptop2_unpermit_computer2_interaction():
	pc_number = 0
	use = false
	
func _on_laptop3_permit_computer3_interaction():
	pc_number = 3
	use = true

func _on_laptop3_unpermit_computer3_interaction():
	pc_number = 0
	use = false
