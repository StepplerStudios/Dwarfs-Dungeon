class_name Player extends CharacterBody2D


@export_category("nodes")
@onready var state_machine: StateMachine = $StateMachine

@onready var anim_tree: AnimationTree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")

@export_category("directions")
var input_dir: Vector2 = Vector2.ZERO
var last_dir: Vector2 = Vector2.DOWN


func _ready() -> void:
	state_machine.Initialize(self)




func _process(delta: float) -> void:

	move(delta)


func move(_delta: float):

	input_dir = Input.get_vector("left","right","up","down")
	
	if input_dir != Vector2.ZERO:
		last_dir = input_dir

	move_and_slide()
