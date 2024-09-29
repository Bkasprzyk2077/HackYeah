extends Node2D

@onready var line_2d: Line2D = $Line2D
@export var tile_map: TileMapLayer
var i = 0
var speed = 0.5
var can_move: bool = true

func _on_timer_timeout():
	if !line_2d.points or !can_move:
		return
	var destination = to_global(line_2d.points[i])
	print(destination)
	var tween: Tween = get_tree().create_tween()
	tween.tween_property($AnimatedSprite2D, "global_position", destination, speed)
	await tween.finished
	i+=1
	if i == len(line_2d.points):
		i = 0
		
		
func _on_area_2d_area_entered(area):
	if area.get_parent() == get_tree().get_first_node_in_group("lemur"):
		get_parent().lose()
		$AnimatedSprite2D/Area2D.queue_free()
		can_move = false
