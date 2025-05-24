class_name RepoTask
extends Node2D

@export var task_my_id : int = -1

@export var task_work_done : float = 0.0
@export var task_work_target : float = 0.0

var target_branch : RepoBranch
var progress_bar: ProgressBar

static var lazy_counter : int = -1

func _ready() -> void:
	lazy_counter += 1	
	progress_bar = get_node("ProgressBar")
	assert (progress_bar != null, "ProgressBar missing")
	
	#task_work_target = randf_range(10, 30)
	task_work_target = 10
	progress_bar.max_value = task_work_target

func _process(delta) -> void:
	pass
	#var rotate_deg = delta * 10
	#rotate(deg_to_rad(rotate_deg))
	
func progress_work_done(progress):
	task_work_done += progress
	#var rotate_deg = progress * 10
	#rotate(deg_to_rad(rotate_deg))
	
	progress_bar.value = task_work_done
	#progress_bar.rotate(deg_to_rad(rotate_deg*-1))
	
	if (task_work_done>=task_work_target):
		target_branch.increment_task_count()
		task_work_done-=task_work_target

func assign_branch(branch : RepoBranch):
	print("assign_branch")
	if (target_branch!=null):
		print("desired_branch!=null")
	target_branch = branch
