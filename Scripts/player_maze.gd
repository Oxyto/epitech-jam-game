extends CharacterBody2D


const SPEED = 300.0
var startingIntensity = 5.0
var currentIntensity = startingIntensity
var decreaseRate = 0.1

func _physics_process(delta):
	
	currentIntensity -= decreaseRate * delta
	currentIntensity = max(0, currentIntensity)
	$PointLight2D.texture_scale = currentIntensity
	if (currentIntensity == 0):
		currentIntensity = 5

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx = Input.get_axis("ui_left", "ui_right")
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
