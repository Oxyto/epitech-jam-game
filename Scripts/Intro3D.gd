extends Node3D

func _input(event):
	if event.is_action_pressed("confirm"):
		get_tree().change_scene_to_file("res://Scenes/darkness_maze.tscn")
