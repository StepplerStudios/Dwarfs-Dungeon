class_name BarrelBroken extends Node2D


@onready var hit_box: HitBox = $HitBox





func _ready() -> void:
	hit_box.Damaged.connect(destroy_barrel)





func destroy_barrel(_hurt_box: HurtBox) -> void:
	self.queue_free()
