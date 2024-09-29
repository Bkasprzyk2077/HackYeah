extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var is_attacking:bool = false

func _on_timer_timeout():
	$Area2D/CollisionShape2D.disabled = !is_attacking
	if is_attacking:
		animated_sprite_2d.play("fire")
	else:
		animated_sprite_2d.play("idle")
	is_attacking = !is_attacking


func _on_area_2d_area_entered(area):
	if area.get_parent() == get_tree().get_first_node_in_group("lemur"):
		get_parent().lose()
		$Area2D.queue_free()
