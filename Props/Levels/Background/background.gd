class_name Background extends Node2D




@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var area_2d: Area2D = $Area2D





func _ready() -> void:
	area_2d.body_entered.connect(_player_entered)
	area_2d.body_exited.connect(_player_exited)





func _player_entered(p: Node2D ) -> void:
	if p is Player:
		anim.play("Fade_In")



func _player_exited(p: Node2D) -> void:
	if p is Player:
		anim.play("Fade_Out")

	pass
