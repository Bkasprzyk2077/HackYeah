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
		$WinSound.play()
		var name_and_lvl = str(GlobalFunctions.player_name, get_parent().name)
		var sw_result: Dictionary = await SilentWolf.Scores.save_score(name_and_lvl, elapsed_time).sw_save_score_complete
		print("Score persisted successfully: " + str(sw_result.score_id))
	else:
		win_lose_label.text = "You lost"
		$LoseSound.play()
	var formated_time = format_time(elapsed_time)
	end_game_time_label.text = formated_time
	end_game_panel.visible = true
	
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	for score in sw_result["scores"]:
		print("scoree: ", score)
		var label = Label.new()
		var name_and_lvl = score["player_name"]
		var level = score["player_name"].substr(score["player_name"].length() - 6, 6)
		if level != get_parent().name:
			continue
		var player_name = name_and_lvl.replace(level, "")
		var time_score = format_time(score["score"])
		label.text = str(player_name, ": ", time_score)
		scores_container.add_child(label)
	#print("Scores: " + str(sw_result.scores))


func _on_next_level_button_pressed():
	get_tree().change_scene_to_file(next_level)


func _on_restart_level_button_pressed():
	get_tree().change_scene_to_file(current_level)
	
