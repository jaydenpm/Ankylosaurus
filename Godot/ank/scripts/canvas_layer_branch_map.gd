extends CanvasLayer

signal player_tool_cancelled

@export var ScenePeep: PackedScene

func _ready():
	add_child(ScenePeep.instantiate())
	add_child(ScenePeep.instantiate())
	add_child(ScenePeep.instantiate())
	add_child(ScenePeep.instantiate())
	add_child(ScenePeep.instantiate())


func _input(event:InputEvent) -> void:
	#Right Mouse Released
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_RIGHT && event.is_released():
		player_tool_cancelled.emit()
