extends CanvasLayer

func _on_button_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene_branch_game.tscn")
