class_name Player extends CharacterBody2D


@export_category("nodes")
@onready var state_machine: StateMachine = $StateMachine
@onready var weapon: Weapon = $WeaponRotate/Weapon
@onready var player_health: ProgressHealthBar = $PlayerHealthBar/PlayerHealth
@onready var anim_tree: AnimationTree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback") 
@onready var hit_box: HitBox = $HitBox



const MAX_HEALTH: int = 6
@export var health: int = 6



@export_category("directions")
var input_dir: Vector2 = Vector2.ZERO
var last_dir: Vector2 = Vector2.DOWN


func _ready() -> void:
	state_machine.Initialize(self)
	GameManager.player = self
	hit_box.Damaged.connect(take_damage)
	player_health.init_health(MAX_HEALTH, health)


func _process(delta: float) -> void:
	move(delta)


func move(_delta: float):

	input_dir = Input.get_vector("left","right","up","down")

	if input_dir != Vector2.ZERO:
		last_dir = input_dir

	move_and_slide()



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		weapon.attack()



func take_damage(_hurt_box: HurtBox) -> void:
		update_health(-_hurt_box.damage)
		player_health.health = health
		if health <= 0:
			die()
		print("Player Health : ", health)



func update_health(amount: int) -> void:
	health = clampi(health + amount, 0, MAX_HEALTH)



func die() -> void:
	self.queue_free()
	set_process(false)
