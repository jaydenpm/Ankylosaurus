extends CanvasLayer

func _on_button_start_game_pressed() -> void:
	get_tree().change_scene_to_file("scene_branch_tree.tscn")
