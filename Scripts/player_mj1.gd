extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -600.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if (velocity.x < -1 || velocity.x > 1):
		if (velocity.x < 0):
			sprite_2d.set_flip_h(true)
		else:
			sprite_2d.set_flip_h(false)
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if (Input.is_action_pressed("reload")):
		Global.player_initial_map_position = Vector2(46,419)
		if get_tree().change_scene_to_file("res://Scenes/darkness_maze.tscn") != OK:
			print("Error: Unavalable scene!")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)

	move_and_slide()
