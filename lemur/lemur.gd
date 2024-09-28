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
	var position_in_map = tile_map.get_coords_for_body_rid(
	#var surronding_tiles = tile_map.get_surrounding_cells()
	
