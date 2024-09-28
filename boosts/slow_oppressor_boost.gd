extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	print("SLOW MO")
	$AnimatedSprite2D.queue_free()
	$Area2D.queue_free()
	var oppressor = get_tree().get_first_node_in_group("oppressor")
	if oppressor:
		var origin_speed = oppressor.speed
		oppressor.speed *= 2
		await get_tree().create_timer(5).timeout
		oppressor.speed = origin_speed
	queue_free()
