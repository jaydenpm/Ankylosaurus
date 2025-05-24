class_name RepoPeep
extends Node2D

@export var peep_my_id : int = -1
@export var peep_work_rate : float = 1.0

var peep_temp_progress : float = 0

static var lazy_counter : int = -1

var assigned_task : RepoTask

func _ready() -> void:
	lazy_counter += 1
	peep_my_id = lazy_counter
	#peep_work_rate = randf_range(0.5, 2.0)
	peep_work_rate = 1

func _process(delta) -> void:
	if(assigned_task!=null):
		var work_done = delta * peep_work_rate
		var rotate_deg = work_done * 100
		rotate(deg_to_rad(rotate_deg))
		
		peep_temp_progress += work_done
		var increment_target = assigned_task.task_work_target / 12
		if (peep_temp_progress >= increment_target):
			assigned_task.progress_work_done(peep_temp_progress)
			peep_temp_progress -= increment_target
	#if (peep_work_done>=peep_work_target):
	#	complete_current_task()
	
func assign_task(task : RepoTask):
	print("assign_task")
	if (assigned_task!=null):
		print("assigned_task!=null")
	assigned_task = task
