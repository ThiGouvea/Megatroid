@tool
extends Node2D

@export_enum('0', '1', '2') var type = '0':
	set(value):
		if get_child_count() > 0 and value != null:
			type = value
			for child in $Options.get_children():
				child.hide()
			var child = $Options.get_child(int(type))
			child.show()
			

func _process(_delta: float) -> void:
	pass
