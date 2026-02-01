class_name HurtBox extends Area2D




func _ready() -> void:
	area_entered.connect(_hit_box_entered)




func _hit_box_entered(h: Area2D) -> void:
	if h is HitBox:
		h.take_damage(self)
