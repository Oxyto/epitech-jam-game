extends Control

const PLAY_SCENE = ""

func _on_play():
	get_tree().change_scene_to_file(PLAY_SCENE)

func _on_quit():
	get_tree().quit()

func _on_button_mouse_entered():
	pass
