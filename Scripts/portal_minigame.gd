@tool

extends Area2D

@export_file("*.tscn") var __scene_file: String
@export var player_Spawn_location = Vector2.ZERO
@onready var sprite_2d = $portalSprite
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
	sprite_2d.rotation += delta * rotationSpeed
	pass


func _on_body_entered(body):
	Global.player_initial_map_position.x += player_Spawn_location.x
	Global.player_initial_map_position.y += player_Spawn_location.y
	if get_tree().change_scene_to_file(__scene_file) != OK:
		print("Error: Unavalable scene!")
