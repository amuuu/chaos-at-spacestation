extends CanvasLayer

const ROCKET_RATE = 0.02
const FLASHLIGHT_RATE = 0.08

var rocket_capacity = int(global.rocket_capacity)
var flashlight_capacity = int(global.light_battery)	

func _ready():
	$RocketValue.text = String(rocket_capacity)+"%"
	$BatteryValue.text = String(100)+"%"
	$TimeValue.text = String(5.5)+" seconds"


func _on_KinematicBody2D_rocket_launched():
	rocket_capacity -= ROCKET_RATE
	global.rocket_capacity = rocket_capacity
	$RocketValue.text=String(int(rocket_capacity))+"%"


func _on_KinematicBody2D_flashlight_increased():
	flashlight_capacity -= FLASHLIGHT_RATE
	$BatteryValue.text=String(int(flashlight_capacity))+"%"


func _on_KinematicBody2D_flashlight_decreased():
	pass


func _on_rocket_charge_rocket():
	rocket_capacity = 100
	$RocketValue.text=String(int(rocket_capacity))+"%"
	
func _process(delta):
	if global.lights_fixed:
		$light_fixed.visible = true
