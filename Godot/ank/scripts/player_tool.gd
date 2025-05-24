class_name PlayerTool
extends Node

enum ToolType{TOOL_NONE, TOOL_PEEP, TOOL_BRANCH, TOOL_TASK}

@export var texture_icon_peep: Texture
@export var texture_icon_branch: Texture
@export var texture_icon_task: Texture

var tool_bar: GridContainer
var active_tool: ToolType = ToolType.TOOL_NONE

signal tool_activated

func _ready():
	tool_bar = get_node("ToolBar")
	assert (tool_bar != null, "ToolBar missing")

func _input(event):
	if event.is_action_pressed("on_player_tool_cancel"):
		tool_change(PlayerTool.ToolType.TOOL_NONE)
	
	if event.is_action_pressed("on_player_tool_activate"):
		var child_hovered
		var child_array = tool_bar.get_children()
		for child in child_array:
			if child.get_global_rect().has_point(event.get_position()):
				child_hovered = true
				break
		
		if (!child_hovered):
			tool_activate(active_tool, event.get_position())

func _on_button_peep_pressed() -> void:
	tool_change(PlayerTool.ToolType.TOOL_PEEP)

func _on_button_branch_pressed() -> void:
	tool_change(PlayerTool.ToolType.TOOL_BRANCH)

func _on_button_task_pressed() -> void:
	tool_change(PlayerTool.ToolType.TOOL_TASK)

func tool_change(tool: ToolType) -> void:
	#print("tool_change: from: ", active_tool, "  to: ", tool)
	if (active_tool == tool):
		return
	active_tool = tool
	update_mouse_cursor()

func update_mouse_cursor() -> void:
	var new_texture
	match active_tool:
		null, PlayerTool.ToolType.TOOL_NONE:
			pass
		PlayerTool.ToolType.TOOL_PEEP:
			new_texture = texture_icon_peep
		PlayerTool.ToolType.TOOL_BRANCH:
			new_texture = texture_icon_branch
		PlayerTool.ToolType.TOOL_TASK:
			new_texture = texture_icon_task
	
	var new_size = Vector2(0,0)
	if (new_texture):
		new_size = new_texture.get_size()*0.5
	
	Input.set_custom_mouse_cursor(new_texture,Input.CURSOR_ARROW, new_size)

func tool_activate(tool: ToolType, position: Vector2) -> void:
	match tool:
		null, ToolType.TOOL_NONE:
			pass
		ToolType.TOOL_PEEP, ToolType.TOOL_BRANCH, ToolType.TOOL_TASK:
			#print("tool_activate: ", tool, ",  position: ", position)
			tool_activated.emit(tool, position)
	
