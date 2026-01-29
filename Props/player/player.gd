class_name Player extends CharacterBody2D


@export_category("nodes")
@onready var anim_tree: AnimationTree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")

@export_category("directions")
var input_dir: Vector2 = Vector2.ZERO
@export var speed: float = 280
@export var accelerations: float = 2200
@export var decelerations: float = 2600


func _process(delta: float) -> void:

	move(delta)


func move(delta: float):

	input_dir = Input.get_vector("left","right","up","down")

	if input_dir != Vector2.ZERO:
		anim_tree.set("parameters/idle/blend_position", input_dir)
		anim_tree.set("parameters/run/blend_position", input_dir)
		anim_state.travel("run")
		velocity = velocity.move_toward(input_dir.normalized() * speed, accelerations * delta)

	else:
		anim_state.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, decelerations * delta)
	move_and_slide()
