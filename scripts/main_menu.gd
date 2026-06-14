extends Control

@export var game_scene : PackedScene
@export var settings_scene : PackedScene

func _on_play_pressed() -> void:
	# TODO : change scenes to main game scene
	print(GameState.scene_rollback_paths)

func _on_settings_pressed() -> void:
	GameState.switch_to_menu(get_tree().current_scene, settings_scene)

func _on_quit_pressed() -> void:
	get_tree().quit()
