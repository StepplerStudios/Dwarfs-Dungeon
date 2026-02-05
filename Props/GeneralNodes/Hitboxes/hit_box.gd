class_name HitBox extends Area2D


signal Damaged (damage: HurtBox)



func take_damage(hurt_box: HurtBox) -> void:
	Damaged.emit(hurt_box)
