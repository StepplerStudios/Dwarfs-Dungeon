class_name AimController extends Node2D

@export var player: Player




func _process(_delta) -> void:
	var dir = get_global_mouse_position() - player.global_position
	if dir.length() < 1:
		return

	
	player.last_dir = dir.normalized()


	player.anim_tree.set(
		"parameters/idle/blend_position",
		player.last_dir
	)
	player.anim_tree.set(
		"parameters/run/blend_position",
		player.last_dir
	)

	pass
