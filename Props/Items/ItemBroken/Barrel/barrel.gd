class_name BarrelBroken extends Node2D



var health: int = 3

@onready var hit_box: HitBox = $HitBox





func _ready() -> void:
	hit_box.Damaged.connect(destroy_barrel)





func destroy_barrel(_hurt_box: HurtBox) -> void:
	if _hurt_box is HurtBox:
		health -= _hurt_box.damage
		if health <= 0:
			self.queue_free()
