class_name BranchMap
extends CanvasLayer

#signal player_tool_cancelled

@export var ScenePeep: PackedScene
@export var SceneBranch: PackedScene

func _ready():
	pass
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

func spawn_peep(position):
	var tempPeep = ScenePeep.instantiate()
	tempPeep.move_local_x(position.x)
	tempPeep.move_local_y(position.y)
	add_child(tempPeep)
