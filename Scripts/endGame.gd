@tool

extends Area2D

@export_file("*.tscn") var __scene_file: String
var rotationSpeed = 0.3

func get_configuration_warning() -> String:
	if __scene_file == "":
		return "funcs file must be set for the portal to work"
	else:
		return ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if get_tree().change_scene_to_file(__scene_file) != OK:
		print("Error: Unavalable scene!")
