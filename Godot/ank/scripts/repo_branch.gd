class_name RepoBranch
extends Node2D

@export var branch_my_id : int = -1
@export var count_tasks : int = 0

static var lazy_counter : int = -1

var change_label: Label

func _ready() -> void:
	lazy_counter += 1
	change_label = get_node("LabelCount")
	assert (change_label != null, "LabelCount missing")
	
	branch_my_id = lazy_counter

func _process(delta) -> void:
	pass
	#var rotate_deg = delta * 10
	#rotate(deg_to_rad(rotate_deg))

func increment_task_count():
	count_tasks +=1
	print("increment_task_count: count_tasks = ", count_tasks)
	change_label.text = str(count_tasks)
