extends Node2D

signal pressed

func _on_area_2d_area_entered(area):
	if area.get_parent() == get_tree().get_first_node_in_group("lemur"):
		pressed.emit()
		queue_free()
