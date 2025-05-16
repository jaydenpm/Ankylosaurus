extends CanvasLayer


func _on_button_back_to_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene_start.tscn")
