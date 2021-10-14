extends KinematicBody2D

export var speed = 100
var is_player = true
func _physics_process(delta):
	var velocity = Vector2.ZERO
	# Make the player move when the arrow keys pressed
	if Input.is_action_pressed("ui_left"): 
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_right"): 
		velocity.x += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_up"): 
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"): 
		velocity.y += 1
	if velocity == Vector2.ZERO:
		$AnimatedSprite.play("idle")
	else:
		$AnimatedSprite.play("run")
	move_and_slide(velocity * speed)
	


func _on_Area2D_body_entered(body):
	hide()
	get_tree().change_scene("res://Control.tscn")
