extends Node2D

@export var tile_map: TileMapLayer

func rescue():
	#print("Vistim rescued!")
	$AudioStreamPlayer2D.play()
	get_parent().victim_count -= 1
	get_parent().check_win()
	$AnimatedSprite2D.play("free_idle")
	$AnimationPlayer.play("escape")
