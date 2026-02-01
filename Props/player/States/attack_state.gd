class_name PlayerStateAttack extends State
 
@export var idle: PlayerStateIdle
@export var run: PlayerStateRun

@onready var pick: Pick = $"../../WeaponRotate/Pick"

var can_attack: bool = false

func Enter() -> void:
	pick.anim_player.animation_finished.connect(end_attack)
	pick.anim_player.play("Pick_Attack")
	can_attack = true
	pass



func Exit() -> void:
	pick.anim_player.animation_finished.disconnect(end_attack)
	can_attack = false
	pass



func Process(_delta: float) -> State:

	if can_attack == false:
		if player.Input_direction == Vector2.ZERO:
			return idle
	else:
		return run

	return null



func Physic(_delta: float) -> State:
	return null



func Unhandled_input(_event: InputEvent) -> State:
	
	return null



func end_attack() -> void:
	can_attack = false
