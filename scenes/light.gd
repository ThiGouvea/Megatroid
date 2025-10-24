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

func _process(_delta: float) -> void:
	pass
