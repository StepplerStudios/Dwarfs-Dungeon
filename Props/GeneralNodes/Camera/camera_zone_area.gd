
class_name CameraZoneArea 
extends Area2D

@export var zoom: Vector2 = Vector2.ONE

@export var follow_player: bool = false
@export var fixed_position: Vector2 = Vector2.ZERO



@export var limit_camera: bool = false
@export var limit_left : int = -10000
@export var limit_top : int = -10000
@export var limit_right : int = 10000
@export var limit_bottom : int = 10000


var collision_shape: CollisionShape2D

@export var cam_node: RoomZoneCamera




func _ready() -> void:
	
	collision_shape = get_child(0)
	monitorable = false
	
	self.body_entered.connect(_zone_entered)
	self.body_exited.connect(_zone_exited)
	
	
	
	
func _zone_entered(p: Player) -> void:
	if p is Player:
		cam_node.overlapping_zones.append(self)
	pass




func _zone_exited(p: Player) -> void:
	if p is Player:
		cam_node.overlapping_zones.erase(self)
	pass
