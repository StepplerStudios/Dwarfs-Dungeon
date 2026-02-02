class_name AimController extends Node2D

@export var player: Player
@export var weapon_rotate: WeaponRotate
var smooth: float = 10


func _process(delta):
	var dir = get_global_mouse_position() - player.global_position
	if dir.length() < 1:
		return

	var target_angle = dir.angle()

	
	weapon_rotate.rotation = lerp_angle(
		weapon_rotate.rotation,
		target_angle,
		smooth * delta
	)


	
	
	player.last_dir = dir.normalized()


	player.anim_tree.set(
		"parameters/idle/blend_position",
		player.last_dir
	)
	player.anim_tree.set(
		"parameters/run/blend_position",
		player.last_dir
	)
