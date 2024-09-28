extends CanvasLayer

var elapsed_time: float = 0.0
@onready var timer_label = $Control/TimerLabel
@onready var end_game_panel = $EndGamePanel
@onready var win_lose_label = $EndGamePanel/VBoxContainer/win_lose_label

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
	end_game_panel.visible = true
