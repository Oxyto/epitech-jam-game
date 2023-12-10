extends Node

var score = 0
@onready var portal = $"portal"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (score == 8):
		portal.position = Vector2(1226,812)
	pass
