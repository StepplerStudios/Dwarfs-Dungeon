class_name Weapon extends Node2D


@export var data: WeaponData

@onready var sprite: Sprite2D = $Sprite2D
@onready var weapon_fx: AnimationPlayer = $WeaponFX
@onready var hurt_box: HurtBox = $HurtBox


var can_attack: = true



func _ready() -> void:
	sprite.texture = data.sprite
	weapon_fx.animation_finished.connect(_end_attack)




func attack():
	if not can_attack:
		return
	
	can_attack = false 
	hurt_box.monitoring = true
	var anim = data.animation
	weapon_fx.play(anim)




func _end_attack(_anim: String) -> void:
	can_attack = true
