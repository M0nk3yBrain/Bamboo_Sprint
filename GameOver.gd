extends Node2D

func _ready():
	$LostVillage.play()
	$gameOver.play()

func _on_replay_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	GlobalPoints.wallHP = 100
	GlobalPoints.points = 0

func _on_quit_pressed():
	get_tree().quit()
