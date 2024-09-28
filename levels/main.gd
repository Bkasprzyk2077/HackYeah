extends Node2D

@onready var tile_map: TileMapLayer = $TileMapLayer

var cells = {
	"A": Vector2i(0,0),
	"B": Vector2i(1,0),
	"C": Vector2i(2,0),
	"D": Vector2i(0,1),
	"E": Vector2i(1,1),
	"F": Vector2i(2,1),
	"G": Vector2i(0,2),
	"H": Vector2i(1,2),
}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for cell in tile_map.get_used_cells():
		if tile_map.get_cell_atlas_coords(cell) == Vector2i(2,2):
			var random_cell = get_unique_tile(cell)
			tile_map.set_cell(cell, 2, random_cell)
			#await get_tree().create_timer(1).timeout


func get_unique_tile(cell):
	var neightbours = tile_map.get_surrounding_cells(cell)
	neightbours.append(cell + Vector2i(-1, -1))
	neightbours.append(cell + Vector2i(1, -1))
	neightbours.append(cell + Vector2i(1, 1))
	neightbours.append(cell + Vector2i(-1, 1))
	neightbours.append(cell + Vector2i(0, 2))
	neightbours.append(cell + Vector2i(2, 0))
	neightbours.append(cell + Vector2i(0, -2))
	neightbours.append(cell + Vector2i(-2, 0))
	#for n in neightbours:
		#print(n)
	var git_list = cells.values().duplicate()
	for n in neightbours:
		git_list.erase(tile_map.get_cell_atlas_coords(n))
	return git_list.pick_random()
