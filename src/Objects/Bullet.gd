class_name Bullet
extends RigidBody2D

onready var animation_player = $AnimationPlayer

func _on_Bullet_body_entered(body):
	if body is Enemy:
		body.queue_free()

func despawn():
	queue_free()
