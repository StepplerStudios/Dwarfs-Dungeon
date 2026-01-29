class_name PlayerStateRun extends State
 
@export var speed: float = 280
@export var aceleration: float = 2200
@export var deceleration: float = 2600

@export var idle: PlayerStateIdle

func Enter() -> void:
	player.anim_state.travel("run")
	pass



func Exit() -> void:
	pass



func Process(_delta: float) -> State:
	if player.input_dir != Vector2.ZERO:
		player.anim_tree.set("parameters/run/blend_position", player.input_dir)
		player.velocity = player.velocity.move_toward(
			player.input_dir.normalized() * speed,
			 aceleration * _delta)
	
	else:
		player.velocity = player.velocity.move_toward(
			Vector2.ZERO,deceleration * _delta)
		return idle
	
	return null



func Physic(_delta: float) -> State:
	return null



func Unhandled_input(_event: InputEvent) -> State:
	return null
