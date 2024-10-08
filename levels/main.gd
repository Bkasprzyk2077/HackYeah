extends Node2D

@export var biome_id: int

@onready var tile_map: TileMapLayer = $TileMapLayer

var cells = {
	"A": Vector2i(0,0),
	"B": Vector2i(1,0),
	"C": Vector2i(2,0),
	"D": Vector2i(3,0),
	"E": Vector2i(4,0),
	"F": Vector2i(5,0),
	"G": Vector2i(6,0),
	"H": Vector2i(0,1),
	"I": Vector2i(1,1),
	"J": Vector2i(2,1),
	"K": Vector2i(3,1),
	"L": Vector2i(4,1),
	"M": Vector2i(5,1),
	"N": Vector2i(6,1),
	"O": Vector2i(0,2),
	"P": Vector2i(1,2),
	"Q": Vector2i(2,2),
	"R": Vector2i(3,2),
	"S": Vector2i(4,2),
	"T": Vector2i(5,2),
	"U": Vector2i(6,2),
	"W": Vector2i(0,3),
	"X": Vector2i(1,3),
	"Y": Vector2i(2,3),
	"Z": Vector2i(3,3),
}

var VOID_CELL_CORDS = Vector2i(4,3)

var tiles_and_letters: Dictionary = {}

var victim_count: int = 0

var is_lost: bool = false

var is_win: bool = false

var is_game_started: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	victim_count = get_tree().get_node_count_in_group("victims")
	for cell in tile_map.get_used_cells():
		if tile_map.get_cell_atlas_coords(cell) == VOID_CELL_CORDS:
			var random_cell = get_unique_tile(cell)
			tile_map.set_cell(cell, biome_id, random_cell)
			tiles_and_letters[cell] = cells.find_key(random_cell)
	for cell in tile_map.get_used_cells():
		if tile_map.get_cell_atlas_coords(cell) in cells.values():
			tile_map.set_cell(cell, biome_id, VOID_CELL_CORDS)
	show_cells(tile_map.local_to_map($Lemur.global_position))

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
	var git_list = cells.values().duplicate()
	for n in neightbours:
		git_list.erase(tile_map.get_cell_atlas_coords(n))
	var random_pick = git_list.pick_random()
	if random_pick == null:
		random_pick = get_unique_tile(cell)
	return random_pick
	
func show_cells(middle_cell):
	var neightbours = tile_map.get_surrounding_cells(middle_cell)
	for n in neightbours:
		if VOID_CELL_CORDS == tile_map.get_cell_atlas_coords(n):
			tile_map.set_cell(n, biome_id, cells[tiles_and_letters[n]])

func check_win():
	if !victim_count and !is_lost:
		is_game_started = false
		is_win = true
		#print("WINNER!")
		$Interface.end_game(true)
		#await get_tree().create_timer(3).timeout
		#get_tree().change_scene_to_file("res://levels/main.tscn")


func lose():
	if !is_lost:
		is_lost = true
		is_game_started = false
		#print("You lost!")
		$Interface.end_game(false)
		#await get_tree().create_timer(3).timeout
		#get_tree().change_scene_to_file("res://levels/main.tscn")
