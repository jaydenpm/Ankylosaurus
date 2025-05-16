extends Node

enum PlayerTool {TOOL_NONE, TOOL_PEEP, TOOL_BRANCH}
var player_active_tool = PlayerTool.TOOL_NONE

var sprite_player_tool : Sprite2D
@export var texture_icon_peep : Texture
@export var texture_icon_branch : Texture

signal player_tool_changed

func _ready():
	sprite_player_tool = get_node("Marker2DCursor/SpriteTool")

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
	
	var new_texture
	match player_active_tool:
		null, PlayerTool.TOOL_NONE:
			pass
		PlayerTool.TOOL_PEEP:
			new_texture = texture_icon_peep
		PlayerTool.TOOL_BRANCH:
			new_texture = texture_icon_branch
	
	if (sprite_player_tool):
		sprite_player_tool.set_texture(new_texture)
	
	var new_size = Vector2(0,0)
	if (new_texture):
		new_size = new_texture.get_size()*0.5

	Input.set_custom_mouse_cursor(new_texture,Input.CURSOR_ARROW, new_size)
