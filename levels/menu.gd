extends CanvasLayer

@onready var play_button = $PanelContainer/VBoxContainer/PlayButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	GlobalFunctions.pick_name($PanelContainer/VBoxContainer/LineEdit.text)
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
