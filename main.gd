extends Node2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _ready():
	$Label/Theme.play()

func _on_theme_finished():
	$Label/Theme.play()
