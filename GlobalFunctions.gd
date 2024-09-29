extends Node

class_name Global

func _ready():
	SilentWolf.configure({
		"api_key": "Fu85rbTxJca43SdqqSMvF4EZr1QChrlL57FizWUq",
		"game_id": "lemur",
		"log_level": 1
	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})


#func _process(delta):
	#if Input.is_action_just_pressed("toggle_fullscreen"):
		#if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_MAXIMIZED:
			#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		#else:
			#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
