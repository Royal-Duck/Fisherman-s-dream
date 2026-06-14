extends Button

func _on_pressed() -> void:
	if !len(GameState.scene_rollback_paths) :
		return
	get_tree().change_scene_to_packed(GameState.scene_rollback_paths.pop_back())
