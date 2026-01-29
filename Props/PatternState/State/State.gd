class_name State extends Node
 
static var player: Player
static var state_machine: StateMachine


func init() -> void:
	pass


func Enter() -> void:
	pass



func Exit() -> void:
	pass



func Process(_delta: float) -> State:
	return null



func Physic(_delta: float) -> State:
	return null



func Unhandled_input(_event: InputEvent) -> State:
	return null
