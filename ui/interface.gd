extends CanvasLayer

var elapsed_time: float = 0.0
@onready var scores_container = $EndGamePanel/HBoxContainer/scores
@onready var timer_label = $Control/TimerLabel
@onready var end_game_panel = $EndGamePanel
@onready var win_lose_label = $EndGamePanel/HBoxContainer/VBoxContainer/win_lose_label
@onready var end_game_time_label = $EndGamePanel/HBoxContainer/VBoxContainer/end_game_time_label

@export var current_level: String
@export var next_level: String
# Called when the node enters the scene tree for the first time.
func _ready():
	end_game_panel.visible = false
	elapsed_time = 0.0

func _process(delta):
	if get_parent().is_game_started:
		elapsed_time += delta
		timer_label.text = format_time(elapsed_time)

func format_time(seconds: float) -> String:
	var minutes = int(seconds) / 60
	var remaining_seconds = int(seconds) % 60
	var centiseconds = int((seconds - int(seconds)) * 100)
	
	return str(minutes).pad_zeros(2) + ":" + str(remaining_seconds).pad_zeros(2) + ":" + str(centiseconds).pad_zeros(2)

func end_game(win: bool):
	if win:
		win_lose_label.text = "You won"
	else:
		win_lose_label.text = "You lost"
	var formated_time = format_time(elapsed_time)
	end_game_time_label.text = formated_time
	end_game_panel.visible = true


func _on_next_level_button_pressed():
	get_tree().change_scene_to_file(next_level)


func _on_restart_level_button_pressed():
	get_tree().change_scene_to_file(current_level)
	
