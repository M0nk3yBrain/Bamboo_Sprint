extends Node2D

var bambooScene = preload("res://Mobs/bamboo_mob.tscn")
var yellowBambooScene = preload("res://Mobs/yellow_bamboo.tscn")
var underAttack = false
var mobCount = 0

func _ready():
	$music.play()
	
#func _process(delta):
#	gameover()

func _on_timer_timeout():
	var bambooInstance = bambooScene.instantiate()
	var spawn_position = Vector2(-10, randf_range(384, 640))
	bambooInstance.position = spawn_position  # Corrected 'position'
	add_child(bambooInstance)

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		mobCount += 1
		attack()

func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		mobCount -= 1

func attack():
	while mobCount > 0:
		GlobalPoints.wallHP -= mobCount
		await get_tree().create_timer(2).timeout
		if GlobalPoints.wallHP <= 0:
			$music.stop()
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func gameover():
	if GlobalPoints.wallHP <= 0:
		$music.stop()
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_music_finished():
	$music.play()

func _on_yellow_bamboo_spanwer_timeout():
	yellowBambooSpawn()

func yellowBambooSpawn():
	var i = 0
	while i < 1:
		var yellowBambooInstance = yellowBambooScene.instantiate()
		var spawn_position = Vector2(-10, randf_range(384, 640))
		yellowBambooInstance.position = spawn_position  # Corrected 'position'
		add_child(yellowBambooInstance)
		await get_tree().create_timer(1.5).timeout
