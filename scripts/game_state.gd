extends Node

func switch_to_menu(from: Node, to: PackedScene) -> void:
	var from_packed := PackedScene.new()
	from_packed.pack(from)
	scene_rollback_paths.append(from_packed)
	get_tree().change_scene_to_packed(to)

var scene_rollback_paths : Array[PackedScene] = [];
