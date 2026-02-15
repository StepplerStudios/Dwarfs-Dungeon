class_name ProgressHealthBar extends Control


var health: int = 0: set =  set_health
var max_health: int = 0

@onready var health_bar: ProgressBar = $HealthBar
@onready var damage_bar: ProgressBar = $HealthBar/DamageBar







func init_health( _health: int, _max_health) -> void:

	health =_health

	health_bar.value = health
	health_bar.max_value = health
	damage_bar.value = health 
	damage_bar.max_value = health




func set_health(new_health: int) -> void:
	
	var prev_health: int = health
	health = new_health
	
	if health <= 0:
		queue_free()
	
	health_bar.value = health

	if health < prev_health:
		await get_tree().create_timer(0.5).timeout
		var tween: Tween = create_tween()
		tween.tween_property(damage_bar, "value", new_health, 0.3)
