extends Area2D

signal loot(count)

# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	animated_sprite_2d.animation = "default"
	

func _on_body_entered(body):
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0,-50), 0.2)
	tween.tween_property(self, "modulate:a", 0.0, 0.2)
	tween.tween_callback(queue_free)
	get_parent().score += 1

