class_name StateMachine extends Node

@export var states: Array[State]
@export var current_state: State
@export var prev_state: State


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	pass


func _process(delta: float) -> void:
	Change_State(current_state.Process(delta))
	pass


func _physics_process(delta: float) -> void:
	Change_State(current_state.Physic(delta))
	pass


func _unhandled_input(event: InputEvent) -> void:
	Change_State(current_state.Unhandled_input(event))
	pass



func Initialize(_player:Player) -> void:
	states = []

	for state in get_children():
		if state is State:
			states.append(state)

	if states.size() == 0:
		return

	states[0].player = _player
	states[0].state_machine = self
	
	for c in states:
		c.init()

	Change_State(states[0])
	process_mode = Node.PROCESS_MODE_INHERIT


func Change_State(new_state: State) -> void:
	if new_state == null or new_state == current_state:
		return 


	if current_state:
		current_state.Exit()

	prev_state = current_state
	current_state = new_state
	current_state.Enter()
