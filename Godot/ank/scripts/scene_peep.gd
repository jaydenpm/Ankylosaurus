extends Node2D

@export var peep_my_id : int = -1
@export var peep_work_rate : float = 1.0
@export var peep_work_done : float = 0.0

static var lazy_counter : int = -1

func _ready() -> void:
	lazy_counter += 1
	peep_my_id = lazy_counter
	
	peep_work_rate = randf_range(0.5, 1.5)	
	
	move_local_x(lazy_counter * 50)
	move_local_y(lazy_counter * 25)
	
	var rand_rotation_deg = randf_range(0, 360)
	rotate(deg_to_rad(rand_rotation_deg))

func _process(delta) -> void:
	peep_work_done += peep_work_rate * delta
	var rotate_deg = peep_work_rate * 2
	rotate(deg_to_rad(rotate_deg))
