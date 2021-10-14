extends KinematicBody2D

export var ACCELERATION = 500
export var MAX_SPEED = 100
export var FRICTION = 500

var velocity = Vector2.ZERO 

var is_player = true
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	# Make the player move when the arrow keys pressed
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector!=Vector2.ZERO:
		#ACCELERATION is frame based while delta makes it pixel based.
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		#Apply friction when no input
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("ui_left"): 
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_right"): 
		$AnimatedSprite.flip_h = false
	if velocity == Vector2.ZERO:
		$AnimatedSprite.play("idle")
	else:
		$AnimatedSprite.play("run")

func _on_Area2D_body_entered(body):
	hide()
	get_tree().change_scene("res://Control.tscn")
