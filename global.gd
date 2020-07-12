extends Node

var lights_fixed = false

var time_left = 200
var rocket_capacity = 100
var light_battery = 100

var won = false

func reset_game():
	time_left = 200
	rocket_capacity = 100
	light_battery = 100
	won = false
	lights_fixed = false
