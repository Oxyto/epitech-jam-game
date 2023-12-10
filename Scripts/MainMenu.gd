extends Control

@onready var ButtonAudio = $"Buttons"

func _on_play():
	get_tree().change_scene_to_file("res://Scenes/Intro3D.tscn")

func _on_quit():
	get_tree().quit()

func _on_button_mouse_entered():
	ButtonAudio.play()
