extends CanvasLayer

signal player_tool_cancelled

func _input(event:InputEvent) -> void:
	#Right Mouse Released
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_RIGHT && event.is_released():
		player_tool_cancelled.emit()
