extends KinematicBody2D

var speed = 30
var player = null

func _physics_process(delta):
	if player != null:
		var direction_to_move = global_position.direction_to(player.global_position)
		move_and_slide(direction_to_move * 30)


func _on_Area2D_body_entered(body):
	if body.is_player:
		player = body


func _on_Area2D_body_exited(body):
	if body == player:
		player = null
