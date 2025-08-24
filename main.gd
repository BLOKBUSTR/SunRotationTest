extends Node

@onready var season_pivot: Node3D = $SeasonPivot
@onready var sun_pivot: Node3D = $SeasonPivot/SunPivot
@onready var light: DirectionalLight3D = $SeasonPivot/SunPivot/Light

@onready var day: HSlider = $Control/MarginContainer/VBoxContainer/Day
@onready var season: HSlider = $Control/MarginContainer/VBoxContainer/Season

#var time: float = 0
#@export var day_speed: float = .01

func _physics_process(_delta: float) -> void:
	# Attempt at automatic day/night
	#time += day_speed
	#if time >= 360: time = 0
	#sun.rotation.x = -time
	
	# Daytime cycle
	sun_pivot.rotation.x = -day.value * PI
	
	#Season cycle
	light.rotation.y = season.value *.65
	season_pivot.rotation.z = -season.value *.65
