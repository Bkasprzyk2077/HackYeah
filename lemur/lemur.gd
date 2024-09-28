extends Node2D

@export var tile_map: TileMapLayer
var step_length = 0
var STEP_LENGTH = 32

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var key_event: InputEventKey = event
		if key_event.pressed:
			var key_name: String = key_event.as_text()
			move(key_name)

func move(letter: String):
	if !tile_map:
		return
	var position_in_map = tile_map.local_to_map(global_position)
	var surronding_tiles = tile_map.get_surrounding_cells(position_in_map)
	#if letter.to_upper() == get_parent().tiles_and_letters[position_in_map]:
		#global_position = tile_map.map_to_local(position_in_map)
		#print("test")
	for n in surronding_tiles:
		if get_parent().tiles_and_letters.has(n):
			if letter.to_upper() == get_parent().tiles_and_letters[n]:
				global_position = tile_map.map_to_local(n)
		#print(get_parent().tiles_and_letters)
	
