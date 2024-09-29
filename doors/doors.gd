extends Node2D

@export var key: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	if key:
		key.connect("pressed", on_key_preesed)

func on_key_preesed():
	$AnimatedSprite2D.global_position = $Marker2D.global_position
