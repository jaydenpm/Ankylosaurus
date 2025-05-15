extends Node

enum PlayerTool {TOOL_NONE, TOOL_PEEP, TOOL_BRANCH}
var player_active_tool = PlayerTool.TOOL_NONE

signal player_tool_changed

func _on_button_peep_pressed() -> void:
	_change_player_active_tool(PlayerTool.TOOL_PEEP)

func _on_button_branch_pressed() -> void:
	_change_player_active_tool(PlayerTool.TOOL_BRANCH)

func _on_player_tool_cancelled() -> void:
	_change_player_active_tool(PlayerTool.TOOL_NONE)

func _change_player_active_tool(tool) -> void:
	if (player_active_tool == tool):
		return
	#print("_change_player_active_tool: from: ", player_active_tool, "  to: ", tool)
	player_active_tool = tool
	player_tool_changed.emit(player_active_tool)
