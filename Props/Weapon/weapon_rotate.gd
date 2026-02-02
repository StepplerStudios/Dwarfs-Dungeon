class_name WeaponRotate extends Node2D


var angular_velocity := 1.0
@export var follow_strength := 48.0
@export var damping := 10.0
@export var weapon: Weapon
var facing: float = -1.0


func _process(delta):
	var target_angle = (get_global_mouse_position() - global_position).angle()
	var diff = angle_difference(rotation, target_angle)

	angular_velocity += diff * follow_strength * delta
	angular_velocity -= angular_velocity * damping * delta

	rotation += angular_velocity * delta


	if abs(rotation) > PI * 0.5:
		weapon.sprite.flip_h = true
	else:
		weapon.sprite.flip_h = false
