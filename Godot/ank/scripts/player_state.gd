extends Node

var player_tool: PlayerTool

func _ready():
	player_tool = get_node("PlayerTool")
	assert (player_tool != null, "PlayerTool missing")
