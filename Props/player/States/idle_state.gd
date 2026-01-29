class_name PlayerStateIdle extends State
 
@export var run: PlayerStateRun


func Enter() -> void:
	player.anim_state.travel("idle")
	pass



func Exit() -> void:
	pass



func Process(_delta: float) -> State:
	if player.input_dir == Vector2.ZERO:
		player.anim_tree.set("parameters/idle/blend_position", player.input_dir)
	else:
		return run
	
	return null



func Physic(_delta: float) -> State:
	return null



func Unhandled_input(_event: InputEvent) -> State:
	return null
