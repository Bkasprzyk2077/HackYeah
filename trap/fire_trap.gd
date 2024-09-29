extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var is_attacking:bool = false

func _on_area_2d_area_entered(area):
	if area.get_parent() == get_tree().get_first_node_in_group("lemur"):
		get_parent().lose()
		$Area2D/CollisionShape2D.disabled = true
		$Timer.stop()
