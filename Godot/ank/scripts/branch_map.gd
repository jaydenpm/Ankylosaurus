class_name BranchMap
extends CanvasLayer

#signal player_tool_cancelled

const ScenePeep = preload("res://scenes/scene_peep.tscn")
const SceneBranch = preload("res://scenes/scene_branch.tscn")
const SceneTask = preload("res://scenes/scene_task.tscn")


func _ready():
	
	
	var tempPeep = ScenePeep.instantiate()
	tempPeep.move_local_x(400)
	tempPeep.move_local_y(250)
	add_child(tempPeep)
	
	var tempTask = SceneTask.instantiate()
	tempTask.move_local_x(500)
	tempTask.move_local_y(250)
	add_child(tempTask)
		
	var tempBranch = SceneBranch.instantiate()
	tempBranch.move_local_x(600)
	tempBranch.move_local_y(250)
	add_child(tempBranch)
	
	tempTask.assign_branch(tempBranch)
	tempPeep.assign_task(tempTask)	
	
	#spawn_branch(Vector2(500,250))
	
	#pass
	#for i in 5:
	#	spawn_peep(Vector2(200+i*50, 200+i*25))

func _on_player_tool_activated(tool, position) -> void:
	match tool:
		null, PlayerTool.ToolType.TOOL_NONE:
			pass
		PlayerTool.ToolType.TOOL_PEEP:
			print("_on_player_tool_activated: TOOL_PEEP,  position: ", position)
			spawn_peep(position)
		PlayerTool.ToolType.TOOL_BRANCH:
			print("_on_player_tool_activated: TOOL_BRANCH,  position: ", position)
			spawn_branch(position)
		PlayerTool.ToolType.TOOL_TASK:
			print("_on_player_tool_activated: TOOL_TASK,  position: ", position)
			spawn_task(position)

func spawn_peep(position):
	var tempPeep = ScenePeep.instantiate()
	tempPeep.move_local_x(position.x)
	tempPeep.move_local_y(position.y)
	add_child(tempPeep)	

func spawn_branch(position):
	var tempBranch = SceneBranch.instantiate()
	tempBranch.move_local_x(position.x)
	tempBranch.move_local_y(position.y)
	add_child(tempBranch)

func spawn_task(position):
	var tempTask = SceneTask.instantiate()
	tempTask.move_local_x(position.x)
	tempTask.move_local_y(position.y)
	add_child(tempTask)
