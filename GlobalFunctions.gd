extends Node

class_name Global
var player_name = "Json"

func _ready():
	SilentWolf.configure({
		"api_key": "Fu85rbTxJca43SdqqSMvF4EZr1QChrlL57FizWUq",
		"game_id": "lemur",
		"log_level": 1
	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})


func pick_name(name):
	player_name = name
