class_name Gun
extends Position2D
# Represents a weapon that spawns and shoots bullets.
# The Cooldown timer controls the cooldown duration between shots.


const BULLET_VELOCITY = 500.0
const Bullet = preload("res://src/Objects/Bullet.tscn")

onready var timer = $Cooldown

# This method is only called by Player.gd.
func shoot(direction = 1):
	if not timer.is_stopped():
		return false
	timer.start()
	var bullet = Bullet.instance()
	bullet.global_position = global_position
	bullet.linear_velocity = global_position.direction_to(get_global_mouse_position()) * BULLET_VELOCITY

	bullet.set_as_toplevel(true)
	add_child(bullet)
	#sound_shoot.play()
	return true
