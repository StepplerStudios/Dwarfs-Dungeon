class_name Spike
extends Node2D

@export var wait_time: float = 3.0

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var hurt_box: HurtBox = $HurtBox

var is_active: bool = false


func _ready() -> void:
	timer.wait_time = wait_time
	timer.timeout.connect(_on_timer_timeout)
	
	_set_state(false) 
	timer.start()


func _on_timer_timeout() -> void:
	is_active = !is_active
	_set_state(is_active)


func _set_state(active: bool) -> void:
	if active:
		anim.play("spike_on")

	else:
		anim.play("spike_off")
