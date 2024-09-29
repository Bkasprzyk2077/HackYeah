extends CanvasLayer

@onready var play_button = $PanelContainer/VBoxContainer/PlayButton

# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer2.visible = false


func _on_play_button_pressed():
	GlobalFunctions.pick_name($PanelContainer/VBoxContainer/LineEdit.text)
	get_tree().change_scene_to_file("res://levels/level_0.tscn")


func _on_choose_level_pressed():
	$PanelContainer2.visible = true
	$PanelContainer.visible = false


func _on_button_pressed():
	GlobalFunctions.pick_name($PanelContainer/VBoxContainer/LineEdit.text)
	$PanelContainer2.visible = false
	$PanelContainer2.visible = true


func _on_button_1_pressed():
	GlobalFunctions.pick_name($PanelContainer/VBoxContainer/LineEdit.text)
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_button_2_pressed():
	GlobalFunctions.pick_name($PanelContainer/VBoxContainer/LineEdit.text)
	get_tree().change_scene_to_file("res://levels/level_2.tscn")


func _on_button_3_pressed():
	GlobalFunctions.pick_name($PanelContainer/VBoxContainer/LineEdit.text)
	get_tree().change_scene_to_file("res://levels/level_3.tscn")


func _on_button_4_pressed():
	GlobalFunctions.pick_name($PanelContainer/VBoxContainer/LineEdit.text)
	get_tree().change_scene_to_file("res://levels/level_4.tscn")
