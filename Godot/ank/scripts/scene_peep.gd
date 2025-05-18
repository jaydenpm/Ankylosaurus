extends Node2D

@export var peep_my_id : int = -1
@export var peep_work_rate : float = 1.0
@export var peep_work_done : float = 0.0

static var lazy_counter : int = -1

func _ready() -> void:
	lazy_counter += 1
	peep_my_id = lazy_counter
	
	peep_work_rate = randf_range(0.5, 2.0)

func _process(delta) -> void:
	peep_work_done += peep_work_rate * delta
	var rotate_deg = peep_work_rate * 2
	rotate(deg_to_rad(rotate_deg))
