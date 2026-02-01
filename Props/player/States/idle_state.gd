class_name PlayerStateIdle extends State
 
@export var run: PlayerStateRun
@export var attack: PlayerStateAttack


func Enter() -> void:
	player.anim_state.travel("idle")
	pass



func Exit() -> void:
	pass



func Process(_delta: float) -> State:
	if player.input_dir != Vector2.ZERO:
		return run
	
	player.anim_tree.set("parameters/idle/blend_position", player.last_dir)
	player.velocity = Vector2.ZERO
	
	return null



func Physic(_delta: float) -> State:
	return null



func Unhandled_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
