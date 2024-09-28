extends Node2D

@export var tile_map: TileMapLayer
var step_length = 0
var STEP_LENGTH = 32
var is_moving: bool = false
var speed: float = 0.5

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var key_event: InputEventKey = event
		if key_event.pressed:
			var key_name: String = key_event.as_text()
			move(key_name)

func move(letter: String):
	if !tile_map or is_moving:
		return
	is_moving = true
	var position_in_map = tile_map.local_to_map(global_position)
	var surronding_tiles = tile_map.get_surrounding_cells(position_in_map)
	for n in surronding_tiles:
		if get_parent().tiles_and_letters.has(n):
			if letter.to_upper() == get_parent().tiles_and_letters[n]:
				#global_position = tile_map.map_to_local(n)
				var destination = tile_map.map_to_local(n)
				var tween: Tween = get_tree().create_tween()
				tween.tween_property(self, "global_position", destination, speed)
				await tween.finished
				get_parent().show_cells(tile_map.local_to_map(destination))
	check_for_victims()
	is_moving = false

func check_for_victims():
	var position_in_map = tile_map.local_to_map(global_position)
	var surronding_tiles = tile_map.get_surrounding_cells(position_in_map)
	for n in surronding_tiles:
		for v in get_tree().get_nodes_in_group("victims"):
			if tile_map.local_to_map(v.global_position) == n:
				v.rescue()
