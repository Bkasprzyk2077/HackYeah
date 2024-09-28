extends Node2D

@export var tile_map: TileMapLayer
var lemur
var lemur_path = []
var speed = 2
var is_moving: bool = false
var can_move: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	lemur = get_tree().get_first_node_in_group("lemur")
	lemur.connect("moved", _on_lemur_moved)
	#lemur_path.append(tile_map.local_to_map(lemur.global_position))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !get_parent().is_game_started:
		return
	if global_position.distance_to(lemur.global_position) <= 20:
		get_parent().lose()
	if lemur and can_move:
		chase()

func chase():
	if is_moving:
		return
	if lemur_path:
		is_moving = true
		var destination = tile_map.map_to_local(lemur_path.pop_front())
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, "global_position", destination, speed)
		await tween.finished
		is_moving = false
	else:
		is_moving = true
		var destination = lemur.global_position
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, "global_position", destination, speed)
		await tween.finished
		is_moving = false
		

func _on_lemur_moved(position: Vector2i):
	if lemur_path.back() != position:
		lemur_path.append(position)
	#print(position)


func _on_timer_timeout():
	can_move = true
