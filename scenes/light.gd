@tool
extends Node2D

@export_enum('0', '1', '2') var type = '0':
	set(value):
		if get_child_count() > 0 and value != null:
			type = value
			for child in $Options.get_children():
				child.hide()
			$Options.get_child(int(type)).show()
@export_color_no_alpha var color = Color(1.0, 1.0, 1.0):
	set(value):
		if get_child_count() > 0 and value != null:
			color = value
			$Options.get_child(int(type)).get_child(1).color = value
@export_range(0, 5) var strength: float = 1.0
	#set(value):
		#if get_child_count() > 0 and value != null:
			#strength = value
			#$Options.get_child(int(type)).get_child(1).energy = value
@export_range(0, 20) var radius: float = 1.0:
	set(value):
		if get_child_count() > 0 and value != null:
			radius = value
			$Options.get_child(int(type)).get_child(1).texture_scale = value
@export_range(0, 200) var flicker: float = 100.0

var noise = FastNoiseLite.new()
var value: float = 0.0
var active_light: PointLight2D

func _ready() -> void:
	for child in $Options.get_children():
		if child.visible:
			active_light = child.get_child(1)

func _process(delta: float) -> void:
	value += flicker * delta
	#print((noise.get_noise_1d(value) + 1 / 4.0) + 0.5)
	if active_light:
		active_light.energy = ((noise.get_noise_1d(value) + 1 / 4.0) + 0.5) * strength
