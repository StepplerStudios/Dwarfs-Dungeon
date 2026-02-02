class_name Weapon extends Node2D


@export var data: WeaponData

@onready var sprite: Sprite2D = $Sprite2D
@onready var weapon_fx: AnimationPlayer = $WeaponFX






func _ready() -> void:
	sprite.texture = data.sprite


func _process(_delta: float) -> void:
	play_animation(data.animation)




func play_animation(_animation: String) -> void:
	weapon_fx.play(_animation)
